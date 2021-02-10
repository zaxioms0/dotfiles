import shutil
import json
from os import remove
from os.path import expandvars, isdir
with open("loc.json") as f:
    data = json.load(f)

for item in data.items():
    path = expandvars(item[1])

    # I know I'll come back to this freaked out
    # The remove lines are only to remove duplicate
    # copies in the repository, dw :)
    if isdir(path):
        shutil.rmtree(item[0], True)
        shutil.copytree(path, item[0])
    else:
        remove(item[0])
        shutil.copy2(path, item[0])
