import base64
import re
import unittest
from os import urandom

import psycopg2
import requests

"""Testing goes via the requests module; this means that we test the actual
web responses of the system as unit tests'"""

BASE = "http://localhost:8000"
db_server = "thebias.nl"
db_port = 5432

admin = requests.Session()
r = admin.post(BASE + "/login", {"mail": "info@utwente.nl", "password": "aoeu"})

teacher = requests.Session()
teacher.post(BASE + "/login", {"mail": "teacher@utwente.nl", "password": "aoeu"})

ta = requests.Session()
ta.post(BASE + "/login", {"mail": "ta@utwente.nl", "password": "aoeu"})

student = requests.Session()
student.post(BASE + "/login", {"mail": "aoeu@utwente.nl", "password": "aoeu"})

unlogged = requests.Session()

ta_id = 0
teacher_id = 0
student_id = 0

class TestLogin(unittest.TestCase):

    def testAdmin(self):
        r = admin.get(BASE + "/rest/whoami")
        self.assertEqual(r.status_code, 200)
        body = r.json()
        self.assertEqual(body["email"], "info@utwente.nl")
        self.assertEqual(body["role"], 0)

    def testTeacher(self):
        global teacher_id
        r = teacher.get(BASE + "/rest/whoami")
        self.assertEqual(r.status_code, 200)
        body = r.json()
        self.assertEqual(body["email"], "teacher@utwente.nl")
        self.assertEqual(body["role"], 1)
        teacher_id = body["id"]

    def testTA(self):
        global ta_id
        r = ta.get(BASE + "/rest/whoami")
        self.assertEqual(r.status_code, 200)
        body = r.json()
        self.assertEqual(body["email"], "ta@utwente.nl")
        self.assertEqual(body["role"], 2)
        ta_id = body["id"]

    def testStudent(self):
        global student_id
        r = student.get(BASE + "/rest/whoami")
        self.assertEqual(r.status_code, 200)
        body = r.json()
        self.assertEqual(body["email"], "aoeu@utwente.nl")
        self.assertEqual(body["role"], 2)
        student_id = body["id"]

    def testUnlogged(self):
        r = unlogged.get(BASE + "/rest/whoami")
        self.assertEqual(r.status_code, 401)


test_db = {
}
test_course = {
    "coursename": base64.b64encode(urandom(18)).decode(),
    "info": "unit_test",
    "fid": 0,
    "schema": "CREATE TABLE test (id SERIAL PRIMARY KEY, name TEXT);",
    "active": True,
}
ta_id = 0


class testCourse(unittest.TestCase):
    # Warning: tests need to be ran in order!
    # Currently relies on alphabetic sorting

    def test0CreateCourse(self):
        global test_course, test_db, teacher_id
        test_course["fid"] = teacher_id
        r = teacher.post(BASE + "/rest/courses/", json=test_course)
        self.assertEqual(r.status_code, 201)

        # check if it exists
        r = teacher.get(BASE + "/rest/courses/")
        self.assertEqual(r.status_code, 200)
        body = r.json()
        for course in body:
            if course["coursename"] == test_course["coursename"]:
                test_course["courseid"] = course["courseid"]
        self.assertTrue(test_course["courseid"] != 0)
        test_db["course"] = test_course["courseid"]

    def test1AddTA(self):
        global test_course, ta_id
        body = {
            "courseid": test_course["courseid"],
            "studentid": ta_id
        }

        r = teacher.post(BASE + "/rest/tas/", json=body)
        self.assertEqual(r.status_code, 201)

        r = teacher.get(BASE + "/rest/tas/own")
        self.assertEqual(r.status_code, 200)
        body = r.json()
        relation_id = 0
        for entry in body:
            if entry["studentid"] == ta_id and entry["courseid"] == test_course["courseid"]:
                relation_id = entry["taid"]
        self.assertNotEqual(0, relation_id)

        # TODO: make the TA do something

        r = teacher.delete(BASE + "/rest/tas/" + str(relation_id))
        self.assertEqual(r.status_code, 202)

        r = teacher.get(BASE + "/rest/tas/own")
        self.assertEqual(r.status_code, 200)
        body = r.json()
        for entry in body:
            if entry["studentid"] == ta_id and entry["courseid"] == test_course["courseid"]:
                self.assertTrue(False)

    def test2CreateDatabase(self):
        global test_db
        # create the database
        r = student.post(BASE + "/rest/studentdatabases/", json=test_db)
        self.assertEqual(r.status_code, 201)
        body = r.json()
        test_db["dbid"] = body["dbid"]
        test_db["databasename"] = body["databasename"]
        test_db["username"] = body["username"]
        test_db["password"] = body["password"]

        # check if it exists
        r = student.get(BASE + "/rest/studentdatabases/own/")
        self.assertEqual(r.status_code, 200)
        found = False
        body = r.json()
        for db in body:
            if db["databasename"] == test_db["databasename"]:
                found = True
        self.assertTrue(found)

    # let's test if the credentials work!
    def test3ConnectToDatabase(self):
        conn = psycopg2.connect(
            user=test_db["username"],
            password=test_db["password"],
            host=db_server,
            port=db_port,
            database=test_db["databasename"]
        )
        with conn.cursor() as cur:
            # let's see if the schema public exists
            # (it shouldn't)
            cur.execute("CREATE SCHEMA public")
            cur.execute("DROP SCHEMA public")
            # check that we have rights to do stuff
            cur.execute("CREATE TABLE test_2(id INT PRIMARY KEY, val TEXT)")
            cur.execute("INSERT INTO test_2(id, val) VALUES(0, 'aoeu')")
            cur.execute("SELECT * FROM test_2;")
            cur.execute("DELETE FROM test_2 WHERE id=0")
            cur.execute("DROP TABLE test_2")
        conn.close()

    def test4DumpDatabase(self):
        global test_db
        conn = psycopg2.connect(
            user=test_db["username"],
            password=test_db["password"],
            host=db_server,
            port=db_port,
            database=test_db["databasename"]
        )
        with conn.cursor() as cur:
            cur.execute("CREATE TABLE dump(id SERIAL PRIMARY KEY, val TEXT);")
            conn.commit()

            r = student.get(BASE + "/rest/dump/" + str(test_db["dbid"]))
            self.assertEqual(r.status_code, 200)
            self.assertTrue(re.search(r'.*CREATE TABLE .*\.dump.*', r.text))

    def test5ResetDatabase(self):
        global test_db

        conn = psycopg2.connect(
            user=test_db["username"],
            password=test_db["password"],
            host=db_server,
            port=db_port,
            database=test_db["databasename"]
        )
        with conn.cursor() as cur:
            #delete a table from the original schema
            #bonus points: throws error if the schema was not correctly instantiated
            cur.execute("DROP TABLE test;")
        conn.close()

        r = student.post(BASE+"/rest/reset/"+str(test_db["dbid"]))
        self.assertEqual(r.status_code, 202)

        conn = psycopg2.connect(
            user=test_db["username"],
            password=test_db["password"],
            host=db_server,
            port=db_port,
            database=test_db["databasename"]
        )
        with conn.cursor() as cur:
            #this is from the schema, and should exist
            cur.execute("INSERT INTO test(name) VALUES('test');")
            try:
                #this is not from the schema, and should not exist
                cur.execute("INSERT INTO dump(val) VALUES('test');")
                self.assertTrue(False)
            except psycopg2.ProgrammingError:
                pass
        conn.close()

    def test6DeleteDatabase(self):
        r = student.get(BASE + "/rest/studentdatabases/own")
        self.assertEqual(r.status_code, 200)
        body = r.json()
        id = 0
        for db in body:
            if db["databasename"] == test_db["databasename"]:
                id = db["dbid"]
        # how we know the db was actually in there before we try to delete
        self.assertTrue(id > 0)

        r = student.delete(BASE + "/rest/studentdatabases/" + str(id))
        self.assertEqual(r.status_code, 202)

        # finally, let's see if the db is still there
        r = student.get(BASE + "/rest/studentdatabases/own")
        self.assertEqual(r.status_code, 200)
        body = r.json()
        for db in body:
            self.assertNotEqual(db["databasename"], test_db["databasename"])

        # and also if we can not connect to it
        try:
            conn = psycopg2.connect(
                user=test_db["username"],
                password=test_db["password"],
                host=db_server,
                port=db_port,
                database=test_db["databasename"]
            )
            # if we reach this point, the test failed
            self.assertTrue(False)
        except psycopg2.OperationalError as e:
            pass

    def test7SchemaVerifier(self):
        global test_course
        #doesn't test correctness of update, but of verifier
        nonsense_schema = "CREATE TABEL test(id SERIAL PRIMARY KEY, val TEXT);"
        r = teacher.post(BASE+"/rest/courses/"+str(test_course["courseid"])+"/schema", data=nonsense_schema)
        self.assertEqual(r.status_code, 400)

        wrong_schema = "CREATE TABLE admin.test(id SERIAL PRIMARY KEY, val TEXT);"
        r = teacher.post(BASE+"/rest/courses/"+str(test_course["courseid"])+"/schema", data=wrong_schema)
        self.assertEqual(r.status_code, 400)

        owned_schema = "CREATE TABLE test(id SERIAL PRIMARY KEY, val TEXT); ALTER TABLE test OWNER TO admin;"
        r = teacher.post(BASE+"/rest/courses/"+str(test_course["courseid"])+"/schema", data=owned_schema)
        self.assertEqual(r.status_code, 400)

    def test8DeleteCourse(self):
        global test_course, test_db
        r = teacher.delete(BASE + "/rest/courses/" + str(test_course["courseid"]))
        self.assertEqual(r.status_code, 202)

        r = teacher.get(BASE + "/rest/courses/")
        body = r.json()
        for course in body:
            self.assertNotEqual(course["coursename"], test_course["coursename"])

        # let's check if that deleted the database we made just now
        try:
            conn = psycopg2.connect(
                user=test_db["username"],
                password=test_db["password"],
                host=db_server,
                port=db_port,
                database=test_db["databasename"]
            )
            # if we reach this point, the test failed
            self.assertTrue(False)
        except psycopg2.OperationalError as e:
            pass


if __name__ == '__main__':
    unittest.main()
