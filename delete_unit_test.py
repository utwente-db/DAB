import requests

BASE = "http://localhost:8000"

s = requests.Session()
r = s.post(BASE + "/login", {"mail": "info@utwente.nl", "password": "aoeu"})

assert (r.status_code == 200)

r = s.get(BASE + "/rest/courses/")
courses = r.json()

for course in courses:
    if course["info"] == "aoeu":
        print("deleting course " + course["coursename"])
        s.delete(BASE + "/rest/courses/" + str(course["courseid"]))
