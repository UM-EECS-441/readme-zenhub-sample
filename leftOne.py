# Import the os module, for the os.walk function
import os
 
# Set the directory you want to start from
rootDir = '.'
for dirName, subdirList, fileList in os.walk(rootDir):
    count = 0
    print(dirName)
    for fname in fileList:
        print(fname)
        if fname != "leftOne.py" and count >= 1:
            os.remove(dirName + "/" + fname)
        count += 1
