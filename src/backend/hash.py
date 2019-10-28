import base64
import hashlib
from os import urandom

"""This file makes secure and expandable password hashes.
Inspired by php, the make function returns a string that contains the hash
method, the salt, and the actual hash of those things, separated by dollars.
This string can then be stored in the database.
To verify a password attempt, one simply needs to put the string from the
database and the attempted password into the verify function, which will return
a boolean.

The advantage of this is that the hashes use a secure function and a salt, this
information is all contained in the output string, and a different hash
function could be used later on without breaking the existing password hashes.
"""

generator = hashlib.sha3_256
method = "sha3_256"


def make(string, salt=None):
    salt = urandom(6)

    h = generator()
    h.update(string.encode())
    h.update(salt)
    spart = base64.b64encode(salt).decode()
    hpart = base64.b64encode(h.digest()).decode()
    return "$".join([method, spart, hpart])


def verify(test, password):
    a = test.split("$")
    m = a[0]
    if (m != method):
        raise UnknownHashException("Only sha3_256 is currently supported")

    salt = base64.b64decode(a[1])
    test = base64.b64decode(a[2])

    h = generator()
    h.update(password.encode())
    h.update(salt)

    return h.digest() == test


def randomNames():
    # WARNING: to prevent issues with the = used in padding being interpreted
    # wrongly (especially by psql), make sure the amount of random bytes is a
    # multiple of 3
    name = urandom(18)
    password = urandom(33)
    return (base64.b64encode(name).decode(), base64.b64encode(password).decode())


def randomPassword():
    return base64.b64encode(urandom(12)).decode()


def token():
    return base64.b64encode(urandom(16)).decode()


class UnknownHashException(TypeError):
    def __init__(self, arg):
        self.strerror = arg
        self.args = {arg}
