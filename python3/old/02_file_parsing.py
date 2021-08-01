from datetime import datetime
import os

# 설정된 환경변수 사용
# print(os.environ['ETHER_REAL'])
f=open(os.environ['ETHER_REAL'] + '/log/geth_syncing.log', 'r')

prev_dt = None
total_count = 0
total_time = 0

for line in f:

	# INFO [02-14|17:04:08] Imported new chain segment
	# print(line[6:20], line[6:8], line[9:11], line[12:14], line[15:17], line[18:20])

	dt = datetime(2018, int(line[6:8]), int(line[9:11]), int(line[12:14]), int(line[15:17]), int(line[18:20]))

	if prev_dt is None:
		prev_dt = dt
		continue

        total_count += 1
        total_time += (dt - prev_dt).total_seconds()
        # print(dt, ' ~ ', prev_dt, ' : ',  (dt - prev_dt).total_seconds())
        prev_dt = dt 


print(total_time, total_count, round((total_time / total_count), 2), 's')
