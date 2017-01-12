import sys
from .const_value import LOCATION


def getLocation():
    """get location from user input
    default beijing
    """
    argvs = sys.argv
    location = argvs[1] if len(argvs) >= 2 else LOCATION
    return location
