import smtplib
from email.message import EmailMessage
from email.headerregistry import Address
from email.utils import make_msgid
from .models import dbmusers
from . import hash




mailer = smtplib.SMTP('localhost');
send_addr = "no-reply@thebias.nl"
#TODO: configure hosts correctly and wire them into here
#TODO: put the product name in here once we come up with one
def send_verification(user):
	addr = Address(user.email, user.email.split("@")[0], user.email)

	salt = user.password.split('$')[1]
	token = hash.make(user.email, salt.encode())

	msg = EmailMessage()
	msg["Subject"] = "Database - verify you email"
	msg["From"] = send_addr
	msg["To"] = addr
	msg.set_content("Please verify your email for the database management system by visiting https://thebias.nl/verify/"+token)
	cid = make_msgid()
	msg.add_alternative("""\
		<html>
			<body>
				<p>Hello """+user.email+""",</p>
				<p>Please verify your email by <a href='https://thebias.nl/verify/"""+token+"""'> clicking here</a>
				<p>Kind Regards</p>
				<p>group 4</p>
			</body>
		<html>""".format(cid=cid[1:-1]), subtype='html')

	sender.send_message(msg)

