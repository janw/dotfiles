print("import datetime, os, pprint, re, sys, time")

import datetime, os, pprint, re, sys, time, json

try:
    import dateutil

    print("import dateutil")
except ImportError as exc:
    print("(python-dateutil is not installed)")
    pass

try:
    import six

    print("import six")
except ImportError as exc:
    print("(six is not installed)")
    pass
