import shutil
import json
from os import remove
from os.path import expandvars, isdir

with open("loc.json") as f:
    data = json.load(f)

for item in data.items():
    path = expandvars(item[1])

    if isdir(path):
        shutil.rmtree(path, True)
        shutil.copytree(item[0], path)
    else:
        remove(path)
        shutil.copy2(item[0], path)
