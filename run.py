#!/usr/bin/env python3

import subprocess
import sys

from time import time

day = int(sys.argv[1])

t = time()
subprocess.call(
    f"carbon-explorer --prelude=src/util.carbon src/day{day}.carbon",
    shell=True)
t = time() - t

print(f"Run time: {t:.4f} s")
