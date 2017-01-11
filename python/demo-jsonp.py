"""
    本例举例与前端配合，同 JSONP 的形式进行调用时的操作方式
    Python 作为后端则主要进行加密工作，并将结果通过 HTML 模板或其他方式渲染在页面中
"""

import time
import hashlib
import hmac
import base64
from urllib import parse
from utils.const_value import UID, KEY, API, LOCATION


def getJsonpUrl():
    """通过 HMAC-SHA1 进行签名验证
    最终返回的 url 可传递给前端进行调用

    但需注意，调用时使用的域名或IP需与当前账号在官网上绑定的域名一致！
    域名绑定可见：http://www.thinkpage.cn/account
    """
    ts = int(time.time())  # 当前时间戳
    params = "ts={ts}&uid={uid}".format(ts=ts, uid=UID)  # 构造验证参数字符串

    key = bytes(KEY, 'UTF-8')
    raw = bytes(params, 'UTF-8')

    # 使用 HMAC-SHA1 方式，以 API 密钥（key）对上一步生成的参数字符串（raw）进行加密
    digester = hmac.new(key, raw, hashlib.sha1).digest()

    # 将上一步生成的加密结果用 base64 编码，并做一个 urlencode，得到签名sig
    signature = base64.encodestring(digester).rstrip()
    sig = parse.quote(signature.decode('utf8'))

    # 构造最终请求的 url
    url = API + "?location={}&".format(LOCATION) + \
        params + '&sig=' + sig + "&callback=?"
    return url

if __name__ == '__main__':
    url = getJsonpUrl()
    print(url)
