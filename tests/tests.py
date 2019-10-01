import unittest
import requests
import psycopg2
from os import urandom
import base64
import re

"""Testing goes via the requests module; this means that we test the actual
web responses of the system as unit tests'"""

BASE = "http://localhost:8000"
db_server = "thebias.nl"
db_port = 5432


admin = requests.Session()
r = admin.post(BASE+"/login", {"mail":"info@sfbtech.nl", "password":"aoeu"})

teacher = requests.Session()
teacher.post(BASE+"/login", {"mail":"teacher@sfbtech.nl", "password":"aoeu"})

ta = requests.Session()
ta.post(BASE+"/login", {"mail":"ta@sfbtech.nl", "password":"aoeu"})

student = requests.Session()
student.post(BASE+"/login", {"mail":"aoeu@sfbtech.nl", "password":"aoeu"})

unlogged = requests.Session()

ta_id = 0

class TestLogin(unittest.TestCase):

	def testAdmin(self):
		r = admin.get(BASE+"/rest/whoami")
		self.assertEqual(r.status_code, 200)
		body = r.json()
		self.assertEqual(body["email"], "info@sfbtech.nl")
		self.assertEqual(body["role"], 0)

	def testTeacher(self):
		r = teacher.get(BASE+"/rest/whoami")
		self.assertEqual(r.status_code, 200)
		body = r.json()
		self.assertEqual(body["email"], "teacher@sfbtech.nl")
		self.assertEqual(body["role"], 1)

	def testTA(self):
		global ta_id
		r = ta.get(BASE+"/rest/whoami")
		self.assertEqual(r.status_code, 200)
		body = r.json()
		self.assertEqual(body["email"], "ta@sfbtech.nl")
		self.assertEqual(body["role"], 2)
		ta_id = body["id"]

	def testStudent(self):
		r = student.get(BASE+"/rest/whoami")
		self.assertEqual(r.status_code, 200)
		body = r.json()
		self.assertEqual(body["email"], "aoeu@sfbtech.nl")
		self.assertEqual(body["role"], 2)

	def testUnlogged(self):
		r = unlogged.get(BASE+"/rest/whoami")
		self.assertEqual(r.status_code, 404)

test_db = {
	"course": 12,
	"schema": 12
}
class testCreateDB(unittest.TestCase):

	#Warning: tests need to be ran in order!
	#Currently relies on alphabetic sorting
	def test0Create(self):
		global test_db
		# create the database
		r = student.post(BASE+"/rest/studentdatabases/", json=test_db)
		self.assertEqual(r.status_code, 201)
		body = r.json()
		test_db["dbid"] = body["dbid"]
		test_db["databasename"] = body["databasename"]
		test_db["username"] = body["username"]
		test_db["password"] = body["password"]

		#check if it exists
		r = student.get(BASE+"/rest/studentdatabases/")
		self.assertEqual(r.status_code, 200)
		found = False
		body = r.json()
		for db in body:
			if db["databasename"] == test_db["databasename"]:
				found = True
		self.assertTrue(found)

	#let's test if the credentials work!
	def test1Connect(self):
		conn = psycopg2.connect(
			user=test_db["username"],
			password=test_db["password"],
			host=db_server,
			port=db_port,
			database=test_db["databasename"]
		)
		with conn.cursor() as cur:
			#let's see if the schema public exists
			#(it shouldn't)
			cur.execute("CREATE SCHEMA public")
			cur.execute("DROP SCHEMA public")
			#check that we have rights to do stuff
			cur.execute("CREATE TABLE test(id INT PRIMARY KEY, val TEXT)")
			cur.execute("INSERT INTO test(id, val) VALUES(0, 'aoeu')")
			cur.execute("SELECT * FROM test;")
			cur.execute("DELETE FROM test WHERE id=0")
			cur.execute("DROP TABLE test")
		conn.close()

	def test2Dump(self):
		global test_db
		conn = psycopg2.connect(
			user=test_db["username"],
			password=test_db["password"],
			host=db_server,
			port=db_port,
			database=test_db["databasename"]
		)
		with conn.cursor() as cur:
			cur.execute("CREATE TABLE test(id SERIAL PRIMARY KEY, val TEXT);")
			conn.commit()

			r = student.get(BASE+"/rest/dump/"+str(test_db["dbid"]))
			self.assertEqual(r.status_code, 200)
			self.assertTrue(re.search(r'.*CREATE TABLE .*\.test.*', r.text))

	def test3Delete(self):
		r = student.get(BASE+"/rest/studentdatabases/")
		self.assertEqual(r.status_code, 200)
		body = r.json()
		id = 0
		for db in body:
			if db["databasename"] == test_db["databasename"]:
				id = db["dbid"]
		# how we know the db was actually in there before we try to delete
		self.assertTrue(id>0)

		r = student.delete(BASE+"/rest/studentdatabases/"+str(id))
		self.assertEqual(r.status_code, 202)

		#finally, let's see if the db is still there
		r = student.get(BASE+"/rest/studentdatabases/")
		self.assertEqual(r.status_code, 200)
		body = r.json()
		for db in body:
			self.assertNotEqual(db["databasename"], test_db["databasename"])

		#and also if we can not connect to it
		try:
			conn = psycopg2.connect(
				user=test_db["username"],
				password=test_db["password"],
				host=db_server,
				port=db_port,
				database=test_db["databasename"]
			)
			#if we reach this point, the test failed
			self.assertTrue(False)
		except psycopg2.OperationalError as e:
			pass


test_db2 = test_db.copy()

test_course = {
	"coursename": base64.b64encode(urandom(18)).decode(),
	"info": "unit_test",
	"fid": 72,
}
ta_id = 0
class testCourse(unittest.TestCase):

	def test0CreateCourse(self):
		global test_course
		r = teacher.post(BASE+"/rest/courses/", json=test_course)
		self.assertEqual(r.status_code, 201)

		#check if it exists
		r = teacher.get(BASE+"/rest/courses/")
		self.assertEqual(r.status_code, 200)
		body = r.json()
		for course in body:
			if course["coursename"] == test_course["coursename"]:
				test_course["courseid"] = course["courseid"]
		self.assertTrue(test_course["courseid"] != 0)

	def test1AddTA(self):
		global test_course, ta_id
		body = { 
			"courseid": test_course["courseid"],
			"studentid": ta_id
		}

		r = teacher.post(BASE+"/rest/tas/", json=body)
		self.assertEqual(r.status_code, 201)

		r = teacher.get(BASE+"/rest/tas/")
		body = r.json()
		relation_id = 0
		for entry in body:
			if entry["studentid"] == ta_id and entry["courseid"] == test_course["courseid"]:
				relation_id = entry["taid"]
		self.assertNotEqual(0, relation_id)

		#TODO: make the TA do something

		r = teacher.delete(BASE+"/rest/tas/"+str(relation_id))
		self.assertEqual(r.status_code, 202)

		r = teacher.get(BASE+"/rest/tas/")
		self.assertEqual(r.status_code, 200)
		body = r.json()
		for entry in body:
			if entry["studentid"] == ta_id and entry["courseid"] == test_course["courseid"]:
				self.assertTrue(False)


	def test2AddDatabase(self):
		global test_course, test_db2
		test_db2["course"] = test_course["courseid"]

		r = student.post(BASE+"/rest/studentdatabases/", json=test_db2)
		self.assertEqual(r.status_code, 201)
		body = r.json()
		test_db2["databasename"] = body["databasename"]
		test_db2["username"] = body["username"]
		test_db2["password"] = body["password"]
		test_db2["dbid"] = body["dbid"]

		r = teacher.get(BASE+"/rest/studentdatabases/")
		body = r.json()
		for db in body:
			if db["databasename"] == test_db2["databasename"]:
				test_db2["dbid"]=db["dbid"]
		self.assertTrue(test_db2["dbid"] != 0)

	def test3DeleteCourse(self):
		global test_course, test_db2
		r = teacher.delete(BASE+"/rest/courses/"+str(test_course["courseid"]))
		self.assertEqual(r.status_code, 202)

		r = teacher.get(BASE+"/rest/courses/")
		body = r.json()
		for course in body:
			self.assertNotEqual(course["coursename"], test_course["coursename"])

		#let's check if that deleted the database we made just now
		try:
			conn = psycopg2.connect(
				user = test_db2["username"],
				password = test_db2["password"],
				host=db_server,
				port=db_port,
				database=test_db2["databasename"]
			)
			#if we reach this point, the test failed
			self.assertTrue(False)
		except psycopg2.OperationalError as e:
			pass


if __name__ == '__main__':
    unittest.main()
