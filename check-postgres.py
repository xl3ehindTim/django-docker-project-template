import os
import time

import psycopg2

while True:
    try:
        conn = psycopg2.connect("dbname='%s' user='%s' host='%s' password='%s'" % (
            os.environ['POSTGRES_DB'],
            os.environ['POSTGRES_USER'],
            os.environ['POSTGRES_HOST'],
            os.environ['POSTGRES_PASSWORD']))
        break
    except Exception as ex:
        print(ex)
        time.sleep(1)