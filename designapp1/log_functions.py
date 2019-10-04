import logging

logger = logging.getLogger("request_logger")

def log_message(execute,message):
    if execute:
        logger.info(message)

def log_message_with_db(userid,databasename,execute,message):
    if execute:
        info_message = 'User: '+str(userid)+ ' , on database: ' + str(databasename) + "," + str(message)
        logger.info(info_message)

