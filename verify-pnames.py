#!/usr/bin/env nix-shell
#!nix-shell -i python3 -p python3Packages.unidiff

import re
from unidiff import PatchSet

for diff in PatchSet.from_filename("483962.patch"):
    if not re.compile(r"src = fetch.* {.*-\s*url = .*\+\s*url = .*};", re.DOTALL).search(str(diff)):
        print("no matches in file: " + diff.path)
