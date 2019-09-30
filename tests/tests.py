import unittest
import requests
import psycopg2
from os import urandom
import base64

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

uname = base64.b64encode(urandom(16)).decode()
test_db = {
	"fid": 73,
	"databasename": uname,
	"course": 12,
	"username" : uname,
	"password" : "aoeu",
	"schema": 12
}

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
		r = ta.get(BASE+"/rest/whoami")
		self.assertEqual(r.status_code, 200)
		body = r.json()
		self.assertEqual(body["email"], "ta@sfbtech.nl")
		self.assertEqual(body["role"], 2)

	def testStudent(self):
		r = student.get(BASE+"/rest/whoami")
		self.assertEqual(r.status_code, 200)
		body = r.json()
		self.assertEqual(body["email"], "aoeu@sfbtech.nl")
		self.assertEqual(body["role"], 2)

	def testUnlogged(self):
		r = unlogged.get(BASE+"/rest/whoami")
		self.assertEqual(r.status_code, 404)

class testCreateDB(unittest.TestCase):

	#Warning: tests need to be ran in order!
	#Currently relies of alphabetic sorting
	def test0Create(self):
		# create the database
		r = student.post(BASE+"/rest/studentdatabases/", json=test_db)
		self.assertEqual(r.status_code, 201)

		#check if we can it exists
		r = student.get(BASE+"/rest/studentdatabases/")
		self.assertEqual(r.status_code, 200)
		found = False
		body = r.json()
		for db in body:
			if db["databasename"] == "ueoa":
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
			
	def test2Delete(self):
		r = student.get(BASE+"/rest/studentdatabases/")
		self.assertEqual(r.status_code, 200)
		body = r.json()
		id = -1
		for db in body:
			if db["databasename"] == "ueoa":
				id = db["dbid"]
		# how we know the db was actually in there before we try to delete
		self.assertTrue(id>=0)

		r = student.delete(BASE+"/rest/studentdatabases/"+str(id))
		self.assertEqual(r.status_code, 204)

		#finally, let's see if the db is still there
		r = student.get(BASE+"/rest/studentdatabases/")
		self.assertEqual(r.status_code, 200)
		body = r.json()
		for db in body:
			self.assertNotEqual(db["databasename"], "ueoa")

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


course_id = 0
db_id = 0
tdb = None
class testCourse(unittest.TestCase):

	test_course = {
		"coursename": base64.b64encode(urandom(16)).decode(),
		"info": "unit_test",
		"fid": 72,
	}


	def test0CreateCourse(self):
		global course_id
		r = teacher.post(BASE+"/rest/courses/", json=self.test_course)
		self.assertEqual(r.status_code, 201)

		#check if it exists
		r = teacher.get(BASE+"/rest/courses/")
		self.assertEqual(r.status_code, 200)
		body = r.json()
		for course in body:
			if course["coursename"] == self.test_course["coursename"]:
				course_id = course["courseid"]
		self.assertTrue(course_id != 0)

	def test1AddDatabase(self):
		global course_id, db_id, tdb, test_db
		tdb = test_db.copy()
		tdb["course"] = course_id

		print(tdb)

		r = student.post(BASE+"/rest/studentdatabases/", json=tdb)
		print(r.text)
		self.assertEqual(r.status_code, 201)

		r = student.get(BASE+"/rest/studentdatabases/")
		body = r.json()
		for db in body:
			if db["databasename"] == tdb["databasename"]:
				db_id=db["dbid"]
		self.assertTrue(db_id != 0)

	def test3DeleteCourse(self):
		global course_id, db_id, tdb
		r = teacher.delete(BASE+"/rest/courses/"+str(course_id))
		self.assertEqual(r.status_code, 202)

		r = teacher.get(BASE+"/rest/courses/")
		body = r.json()
		for course in body:
			self.assertNotEqual(course["coursename"], self.test_course["coursename"])

		#let's check if that deleted the database we made just now
		try:
			conn = psycopg2.connect(
				user = tdb["username"],
				password = tdb["password"],
				host=db_server,
				port=db_port,
				database=tdb["databasename"]
			)
			#if we reach this point, the test failed
			self.assertTrue(False)
		except psycopg2.OperationalError as e:
			pass


if __name__ == '__main__':
    unittest.main()
