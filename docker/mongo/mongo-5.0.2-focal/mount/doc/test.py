#!/usr/bin/python3
import os
import configparser
from pathlib import Path
from datetime import date

# os.system('ls')
config = configparser.ConfigParser()
config.read('/data/my-data/my-config.ini')
print(config['selenium']['card.path'])

d = date.today()
print(d.isoformat())
print(date.today().strftime('%Y%m%d'))