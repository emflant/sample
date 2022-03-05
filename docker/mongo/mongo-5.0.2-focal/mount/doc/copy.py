#!/usr/bin/python3

import os
import configparser
from pathlib import Path
from datetime import date

config = configparser.ConfigParser()
config.read('/data/my-data/my-config.ini')
# print(config['mongo']['prod.uri'])
# print(config['mongo']['archive.path'])

v_today = date.today().strftime("%Y%m%d")
v_path = config["mongo"]["archive.path"]

v_archive_file = f'{v_path}test.{v_today}.archive'
v_prod_uri = config["mongo"]["prod.uri"]
v_test_uri = 'mongodb://my-mongo:27017/test'

v_command1 = f'mongodump --db=test --archive={v_archive_file} --uri="{v_prod_uri}"'
print(f'--------------------------------------------------------')
print(f'{v_command1}')
print(f'--------------------------------------------------------')
os.system(v_command1)


v_command2 = f'mongo {v_test_uri} --eval "db.dropDatabase()"'
print(f'--------------------------------------------------------')
print(f'{v_command2}')
print(f'--------------------------------------------------------')
os.system(v_command2)


v_command3 = f'mongorestore --archive={v_archive_file} --uri="{v_test_uri}"'
print(f'--------------------------------------------------------')
print(f'{v_command3}')
print(f'--------------------------------------------------------')
os.system(v_command3)