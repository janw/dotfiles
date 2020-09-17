import sys
from IPython import version_info

print(
    "Python {}.{}.{}, IPython {}.{}.{}".format(
        sys.version_info.major,
        sys.version_info.minor,
        sys.version_info.micro,
        version_info[0],
        version_info[1],
        version_info[2],
    )
)
