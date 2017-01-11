import json
import requests
from utils.const_value import API, KEY, LOCATION, UNIT, LANGUAGE


def fetchWeather():
    result = requests.get(API, params={
        'key': KEY,
        'location': LOCATION,
        'language': LANGUAGE,
        'unit': UNIT
    }, timeout=1)
    return result.text

if __name__ == '__main__':
    result = fetchWeather()
    print(result)
