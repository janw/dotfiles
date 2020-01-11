print("Importing from IPython startup ...")

import datetime, os, pprint, re, sys, time, json

print("-> datetime, os, pprint, re, sys, time")

try:
    import dateutil

    print("-> dateutil")
except ModuleNotFoundError:
    print("(python-dateutil is not installed)")
    pass
