import smtplib
from email.headerregistry import Address
from email.message import EmailMessage
from email.utils import make_msgid


# TODO: configure hosts correctly and wire them into here
# TODO: put the product name in here once we come up with one
def send_verification(user):
    # done inside the function to ensure it does not always crash the development server
    mailer = smtplib.SMTP('localhost');
    send_addr = "no-reply@thebias.nl"

    a = user["email"].split("@")
    addr = Address(user["email"], a[0], a[1])

    msg = EmailMessage()
    msg["Subject"] = "Database Administration Bundle - Please verify your email"
    msg["From"] = send_addr
    msg["To"] = addr
    msg.set_content(
        "Please verify your email for the Database Administration Bundle by visiting https://db.thebias.nl/verify/" + user[
            "token"])
    cid = make_msgid()
    msg.add_alternative("""\
		<html>
			<body>
				<p>Hello """ + user["email"] + """,</p>
				<p>You have requested an account for the Database Administration Bundle.</p>
				<p>Please verify your email by using the following link: <a href='https://db.thebias.nl/verify/""" + user["token"] + """'>https://db.thebias.nl/verify/""" + user["token"] + """</a>
				<p>Kind Regards,</p>
				<p>Database Administration Bundle</p>
			</body>
		<html>""".format(cid=cid[1:-1]), subtype='html')

    mailer.send_message(msg)
