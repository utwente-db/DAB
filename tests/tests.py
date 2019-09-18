import unittest
import requests

"""Testing goes via the requests module; this means that we test the actual
web responses of the system as unit tests'"""

BASE = "http://localhost:8000"

admin = requests.Session()
r = admin.post(BASE+"/login", {"mail":"info@sfbtech.nl", "password":"aoeu"})

teacher = requests.Session()
teacher.post(BASE+"/login", {"mail":"teacher@sfbtech.nl", "password":"aoeu"})

ta = requests.Session()
ta.post(BASE+"/login", {"mail":"ta@sfbtech.nl", "password":"aoeu"})

student = requests.Session()
student.post(BASE+"/login", {"mail":"aoeu@sfbtech.nl", "password":"aoeu"})

unlogged = requests.Session()

class TestLogin(unittest.TestCase):

	def testAdmin(self):
		r = admin.get(BASE+"/whoami")
		self.assertEqual(r.status_code, 200)
		body = r.json()
		self.assertEqual(body["email"], "info@sfbtech.nl")
		self.assertEqual(body["role"], 0)

	def testTeacher(self):
		r = teacher.get(BASE+"/whoami")
		self.assertEqual(r.status_code, 200)
		body = r.json()
		self.assertEqual(body["email"], "teacher@sfbtech.nl")
		self.assertEqual(body["role"], 1)

	def testTA(self):
		r = ta.get(BASE+"/whoami")
		self.assertEqual(r.status_code, 200)
		body = r.json()
		self.assertEqual(body["email"], "ta@sfbtech.nl")
		self.assertEqual(body["role"], 2)

	def testStudent(self):
		r = student.get(BASE+"/whoami")
		self.assertEqual(r.status_code, 200)
		body = r.json()
		self.assertEqual(body["email"], "aoeu@sfbtech.nl")
		self.assertEqual(body["role"], 3)

	def testUnlogged(self):
		r = unlogged.get(BASE+"/whoami")
		self.assertEqual(r.status_code, 404)

if __name__ == '__main__':
    unittest.main()
