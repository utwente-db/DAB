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

"""Generates a formatted hash from the provided password

:param string: The password to be hashed
:type string: string, or really anything that has a .encode() function
:param salt=None: The salt to be used. Will be randomly generated if None
:type salt: bytes
:returns: the formatted password hash
:rtype: string
"""
def make(string, salt=None):
    salt = urandom(6)

    h = generator()
    h.update(string.encode())
    h.update(salt)
    spart = base64.b64encode(salt).decode()
    hpart = base64.b64encode(h.digest()).decode()
    return "$".join([method, spart, hpart])

"""Verifies that the password was used to generate the hash

:param test: The hash to test for
:type test: string
:param password: The password to test
:type password: string
:returns: Whether the password matches the hash
:rtype: boolean
"""
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

"""Generatation of random names and passwords

:returns: a random 18 byte name and 33 byte password, both in base64
:rtype: tuple of strings
"""
def randomNames():
    # WARNING: to prevent issues with the = used in padding being interpreted
    # wrongly (especially by psql), make sure the amount of random bytes is a
    # multiple of 3
    name = urandom(18)
    password = urandom(33)
    return (base64.b64encode(name).decode(), base64.b64encode(password).decode())

"""Generates a random 12 byte password

:returns: A 12 byte random password is base64
:rtype: string
"""
def randomPassword():
    return base64.b64encode(urandom(12)).decode()

"""Returns a random 16 byte token

:returns: a random 16 byte token, in base64
:rtype: string
"""
def token():
    return base64.b64encode(urandom(16)).decode()


class UnknownHashException(TypeError):
    def __init__(self, arg):
        self.strerror = arg
        self.args = {arg}
