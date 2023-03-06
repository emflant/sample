#!/usr/bin/python3

import os
import configparser
from pathlib import Path
from datetime import date
import datetime

v_today = datetime.datetime.now().strftime("%Y%m%d_%H%M%S")

# 운영(prod) 데이터의 백업파일을 만든다.
v_command1= f'pg_dump prod > ./dumpfile/dumpfile_{v_today}'

print(f'--------------------------------------------------------')
print(f'{v_command1}')
print(f'--------------------------------------------------------')
os.system(v_command1)


# 테스트(test) DB 전체를 삭제한다.
v_command2 = f'dropdb -f test'
print(f'--------------------------------------------------------')
print(f'{v_command2}')
print(f'--------------------------------------------------------')
os.system(v_command2)


# 테스트 DB 를 재생성한다.
v_command3 = f'createdb test'
print(f'--------------------------------------------------------')
print(f'{v_command3}')
print(f'--------------------------------------------------------')
os.system(v_command3)

# 운영 백업데이터를 가지고 test 환경에 복원한다. 
v_command4 = f'psql test < ./dumpfile/dumpfile_{v_today}'
print(f'--------------------------------------------------------')
print(f'{v_command4}')
print(f'--------------------------------------------------------')
os.system(v_command4)
