
fileType = '@shBrushPython.js'

reader = open('01_file.py','r')
result = '<pre class=\"brush: ' + fileType + ';\">\n' + reader.read().strip() + '\n</pre>';
reader.close()

print(result)

writer = open('ResultPreTag.txt','w')
writer.write(result)

