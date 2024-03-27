import sys, os.path
# Usage
# python evil-rebinder.py [sourcefile]  [backupfilename]
# backupfilename is optional, and will appear in same dir as source

def getAndBackupFile(fileName):
    fileContents = ""
    with open(fileName, "r") as file:
        fileContents = file.read()

    backupPathIndex = fileName.rfind("/")

    backupFileName = ""
    if len(sys.argv) <= 2:
        backupFileName = "/evil-maps.el.bkup"
    else:
        backupFileName = "/" + sys.argv[2]
    if backupPathIndex == -1: 
        backupPathIndex = 0
        backupFileName = backupFileName[1:]

    backupFile = fileName[: backupPathIndex] + backupFileName
    if not os.path.isfile(backupFile):
        with open(backupFile, "w") as file:
            file.write(fileContents)

    return fileContents.split("\n")

def expandList(lst):
    lstCopy = lst.copy()
    for x in lst:
        lstCopy.append((x[1], x[0]))
    return lstCopy

def unsplit(lst, delimiter):
    ans = ""
    for x in lst: ans += x + delimiter
    return ans

filestr = getAndBackupFile(sys.argv[1])

replaceList = [
        ("h", "n"),
        ("j", "e"),
        ("k", "i"),
        ("l", "o"),
        ("H", "N"),
        ("J", "E"),
        ("K", "I"),
        ("L", "O"),
        ]

replaceList = expandList(replaceList)
#print(replaceList)

for i in range(len(filestr)):
    x = filestr[i]

    # Make sure it isn't a command, a DEL keyword, or a comment
    if len(x) == 0 or "evil-ex-define-cmd" in x or "DEL" in x or x[-1] != ")": continue
    xFilt= x[x.find('"'):]

    for y in replaceList:
        if y[0] + '"' in xFilt:
            # Don't mess up the modifier keys
            if '\\' + y[0] + '"' in xFilt: continue
            filestr[i] = x.replace(y[0] + '"', y[1] + '"')
            break

output = unsplit(filestr, "\n")
with open(sys.argv[1], "w") as file:
    file.write(output)
