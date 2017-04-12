import requests
'''
运行前请先更改 payload 中键 'key'、'location'所对应的值
'''

#获取指定城市天气实况的 api 地址
api_url = 'https://api.seniverse.com/v3/weather/now.json'

payload = {
    'key' : '你的key值', #你注册后得到的 key 值，在此处查看 https://www.seniverse.com/doc#info
    'location' : '你要查询的城市',  #城市的拼音如 "beijing" 或直接传入"北京"
    'language' : 'zh-Hans',
    'unit' :'c',
}

def fetchWeather():
    result = requests.get(api_url, params=payload, timeout=1)
    return result.text

if __name__ == '__main__':
    result = fetchWeather()
    print(result)
