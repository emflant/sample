from pathlib import Path

import datetime
import os
import shutil


save_path = '.'
read_paths = {'GF8':'./temp_gf8', 'GX1':'./temp_gx1'}

results = {}


def make_dir(dir_path) :
	
	# print('dir_path : ' + str(dir_path))

	if dir_path.parent.exists() == False :
		make_dir(dir_path.parent)
		print(str(dir_path) + ' is not exists')
		dir_path.mkdir()
		
	else :
		if dir_path.exists() == False :
			print(str(dir_path) + ' is not exists')
			dir_path.mkdir()
	

def copy_files(camera_type) :

	p=Path(read_paths[camera_type])
	
	print('start copy files : ' + str(p))
	
	count = 0
	
	# read files  
	for child1 in p.iterdir() :
		
		if child1.is_dir() :
			print(ciildi)
			continue
	
		type_index = int(str(child1).rfind('.'))+1
		
		
		file_type = str(child1)[type_index:]
		
		
		if file_type != 'RW2' and file_type != 'JPG' and file_type != 'MP4'  :
		    continue
		
		
		mtime = child1.stat().st_mtime
		
		file_datetime = datetime.datetime.fromtimestamp(mtime)
		#print(file_datetime)
		yyyy = str(file_datetime)[0:4]
		yyyymmdd = str(file_datetime)[0:10]
	
		target_full_file = save_path + '/' + yyyy + '/' + yyyymmdd + \
				'/' + camera_type + '/' + file_type + '/' + child1.name
	
		target_path = Path(target_full_file)
		
		make_dir(target_path.parent)
	
		print(str(child1) + ' ==> ' + target_full_file)
		shutil.copy2(str(child1), target_full_file)
		count = count + 1
	    
	# print(camera_type + ' copy count : '+ str(count))
	results[camera_type] = count
	count = 0




for k in read_paths.keys() :
	copy_files(k)

for camera_type in results.keys() :
	print(camera_type + ' copy count : '+ str(results[camera_type]))
	
	
