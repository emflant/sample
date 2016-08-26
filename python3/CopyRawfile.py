from pathlib import Path

import datetime
import os
import shutil


save_path = '.'
read_path = './temp'


read_file_type_set = set()


p=Path(read_path)

# read files  
for child1 in p.iterdir() :
	if child1.is_dir() :
		print(ciildi)
		continue

	type_index = int(str(child1).rfind('.'))+1
	
	if str(child1)[type_index:] != 'RW2' :
	    continue
	
	print('read file = ' + str(child1))
	read_file_type_set.add(str(child1)[type_index:])
	
	mtime = child1.stat().st_mtime
	
	file_datetime = datetime.datetime.fromtimestamp(mtime)
	#print(file_datetime)
	yyyy = str(file_datetime)[0:4]
	yyyymmdd = str(file_datetime)[0:10]
	
	
	
	target_dir = save_path + '/' + yyyy + '/' + yyyymmdd
	target_file = str(file_datetime) + '.RW2'
	
	target_path = Path(target_dir)
	
    # check if the target folder exists
	if target_path.exists() == False :
		print(target_dir + ' is not exists')
		target_path.mkdir()
    
	
	target_full_file = target_dir + '/' + target_file
	print('save file = ' + target_full_file)
	shutil.copyfile(str(child1), target_full_file)
    
    
print('the end')

