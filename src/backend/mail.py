import smtplib
from email.headerregistry import Address
from email.message import EmailMessage
from email.utils import make_msgid

from django.conf import settings


# TODO: configure hosts correctly and wire them into here
# TODO: put the product name in here once we come up with one
def send_verification(user, created=False):
    a = user["email"].split("@")
    addr = Address(user["email"], a[0], a[1])

    msg = EmailMessage()
    msg["Subject"] = "Database Administration Bundle - Please verify your email"
    msg["From"] = settings.EMAIL_SENDER
    msg["To"] = addr
    msg.set_content(
        "Please verify your email for the Database Administration Bundle by visiting https://" + settings.HOST_SERVER + "/verify/" +
        user[
            "token"])
    cid = make_msgid()
    msg.add_alternative("""\
		<html>
			<body>
				<p>Hello """ + user["email"] + """,</p>
                """+
				("""<p>You have requested an account for the Database Administration Bundle.</p>""" if not created else """<p>An account hase been requested for you at the Database Administration Bundle</p>""")
				+"""<p>Please verify your email by using <a href='https://""" + settings.HOST_SERVER + """/verify/""" +
                        user["token"] + """'>this link</a>.
				<p>Kind Regards,</p>
				<p>Database Administration Bundle</p>
			</body>
		</html>
        """.format(cid=cid[1:-1]), subtype='html')

    if not settings.DEBUG:
        mailer = smtplib.SMTP(settings.EMAIL_SERVER)
        mailer.send_message(msg)
    else:
        print(msg)

def send_creation_notice(user):
    a = user["email"].split("@")
    addr = Address(user["email"], a[0], a[1])

    msg = EmailMessage()
    msg["Subject"] = "Database Administration Bundle - An account has been made for you"
    msg["From"] = settings.EMAIL_SENDER
    msg["To"] = addr
    msg.set_content(
        "An account has been made for this email at the Database Administration Bundle. If this does not ring a bell, you can safel ignore this message.\n\
        If it does, the administrator should have already contacted you. You can log in via https://"+settings.HOST_SERVER+"/")
    cid = make_msgid()
    msg.add_alternative("""\
        <html>
            <body>
                <p>Hello """+user["email"]+""",</p>
                <p>Somebody has made an account for you at the Database Administration Bundle. If this does not ring a bell, you can safely ignore this message.</p>
                <p>If it does, the administrator should have already contacted you. You can log in <a href='https://"""+settings.HOST_SERVER+"""/'>here</a>.</p>
                <p>Your email has already been verified.</p>
                <p>Kind Regards,</p>
                <p>Database Administration Bundle</p>
            </body>
        </html>
        """.format(cid=cid[1:-1]), subtype='html')

    if not settings.DEBUG:
        mailer = smtplib.SMTP(settings.EMAIL_SERVER)
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
        "Somebody has requested a password reset. If this was not you, you can safely ignore this email. If this was you, please visit https://" + settings.HOST_SERVER + "/reset_password/" + str(
            user["id"]) + "/" + user["token"])
    cid = make_msgid()
    msg.add_alternative("""\
        <html>
            <body>
                <p>Hello """ + user["email"] + """,</p>
                <p>Somebody has requested a password reset for your account on the database administration bundle.</p>
                <p>If this was not you, you can safely ignore this message</>
                <p>Otherwise. <a href='https://""" + settings.HOST_SERVER + """/reset_password/""" + str(
        user["id"]) + "/" + user["token"] + """'>Click here to reset your password</a></p>
                <p>Please note that the token will be valid for 4 hours</p>
                <p>Kind Regards,</p>
                <p>Database Administration Bundle</p>
            </body>
        </html>
        """.format(cid=cid[1:-1]), subtype='html')

    if not settings.DEBUG:
        mailer = smtplib.SMTP(settings.EMAIL_SERVER)
        mailer.send_message(msg)
    else:
        print(msg)
