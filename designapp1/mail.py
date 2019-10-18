import smtplib
from email.headerregistry import Address
from email.message import EmailMessage
from email.utils import make_msgid
from django.conf import settings


# TODO: configure hosts correctly and wire them into here
# TODO: put the product name in here once we come up with one
def send_verification(user):
    a = user["email"].split("@")
    addr = Address(user["email"], a[0], a[1])

    msg = EmailMessage()
    msg["Subject"] = "Database Administration Bundle - Please verify your email"
    msg["From"] = settings.EMAIL_SENDER
    msg["To"] = addr
    msg.set_content(
        "Please verify your email for the Database Administration Bundle by visiting https://"+settings.HOST_SERVER+"/verify/" + user[
            "token"])
    cid = make_msgid()
    msg.add_alternative("""\
		<html>
			<body>
				<p>Hello """ + user["email"] + """,</p>
				<p>You have requested an account for the Database Administration Bundle.</p>
				<p>Please verify your email by using <a href='https://"""+settings.HOST_SERVER+"""/verify/""" + user["token"] + """'>this link</a>.
				<p>Kind Regards,</p>
				<p>Database Administration Bundle</p>
			</body>
		<html>""".format(cid=cid[1:-1]), subtype='html')

    if not settings.DEBUG:
        mailer = smtplib.SMTP(settings.EMAIL_SERVER);
        mailer.send_message(msg)
    else:
        print(msg)

def send_reset(user):
    a = user["email"].split("@")
    addr = Address(user["email"], a[0], a[1])

    msg = EmailMessage()
    msg["Subject"] = "Database Administration Bundle - Password Reset"
    msg["From"] = settings.EMAIL_SENDER
    msg["To"] = addr
    msg.set_content(
        "Somebody has requested a password reset. If this was not you, you can safely ignore this email. If this was you, please visit https://"+settings.HOST_SERVER+"/reset_password/" + str(user["id"]) + "/" + user["token"])
    cid = make_msgid()
    msg.add_alternative("""\
        <html>
            <body>
                <p>Hello """ + user["email"] + """,</p>
                <p>Somebody has requested a password reset for your account on the database administration bundle.</p>
                <p>If this was not you, you can safely ignore this message</>
                <p>Otherwise. <a href='https://"""+settings.HOST_SERVER+"""/reset_password/""" + str(user["id"]) + "/" + user["token"] + """'>Click here to reset your password</a></p>
                <p>Please note that the token will be valid for 4 hours</p>
                <p>Kind Regards,</p>
                <p>Database Administration Bundle</p>
            </body>
        </html>
        """.format(cid=cid[1:-1]), subtype='html')

    if not settings.DEBUG:
        mailer = smtplib.SMTP(settings.EMAIL_SERVER);
        mailer.send_message(msg)
    else:
        print(msg)

