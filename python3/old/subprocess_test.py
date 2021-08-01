import subprocess
from pprint import pprint

#os.system('ls -al')
#result = subprocess.call(["ls", "-l"])
#print(result) # 정상적으로 호출이 완료되면 0 으로 리턴

#result2 = subprocess.check_output(['ls', '-l'])
#print(result2)

cmd = 'sudo -H python3 -m pip list --outdated'
print(cmd.split(' '))
# result2 = subprocess.check_output(['sudo', '-H', 'python3', '-m', 'pip', 'list', '--outdated'])
result2 = subprocess.check_output(cmd.split(' '), universal_newlines = True)

pprint(str(result2).split('\n'))
result3 = str(result2).split('\n')
result4 = result3[2:-1] # 앞에 2개, 맨뒤 1개 row 는 제거.
pprint(result4)

new_list = []

cmd2 = 'sudo -H python3 -m pip install -U '

for package_name in result4:
    temp_list = package_name.split(' ')
    cmd3 = cmd2 + temp_list[0]
    pprint(cmd3)
    subprocess.call(cmd3.split(' '))
