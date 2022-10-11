#!/usr/bin/env python
import re, sys

for line in re.finditer(
    r"Elapsed Time: ([0-9]*\.[0-9]+)",
    sys.stdin.read(),
    re.MULTILINE,
):
    print("{}".format(line.group(1)))
