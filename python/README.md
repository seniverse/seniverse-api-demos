# Python3 调用 API 示例

Python3 通过发送网络请求进行 API 的调用

## 后端直接进行 API 调用

### 使用 [requests](https://github.com/kennethreitz/requests/)

通过第三方 Http 请求库进行接口调用。

```bash
$ pip3 install requests
```

```python
# 发送 get 请求
result = requests.get(url, params, timeout)
```

### 使用 urllib

通过官方标准库`urllib`进行接口的调用。

因为 API 为 https，在直接使用 urllib 进行请求时会报错：`urllib.error.URLError: <urlopen error [SSL: CERTIFICATE_VERIFY_FAILED] certificate verify failed (_ssl.c:646)>`，需要我们引用`ssl`库进行配置

更多详细信息可查看：[Stackoverflow - "SSL: CERTIFICATE_VERIFY_FAILED" Error](http://stackoverflow.com/questions/27835619/ssl-certificate-verify-failed-error)

```python
from urllib import request, parse

# 通过 parse 将请求参数转为字符串
params = parse.urlencode({
  'key': KEY,
  'location': LOCATION,
  'language': LANGUAGE,
  'unit': UNIT
})

# 构建请求
req = request.Request(url)
# 发送请求，读取返回值并进行 UTF-8 编码
response = request.urlopen(req, context=gcontext).read().decode('UTF-8')
```

## 后端输出 URL，由前端通过 JSONP 的方式进行调用

使用官方标准库进行签名：

- time
- hashlib
- hmac
- base64
- urllib

具体签名方式可以参考：[demo-jsonp.py](./demo-jsonp.py)，直接运行文件将会输出最终应该调用的 URL，之后将该 URL 传递至前端进行调用。

但需注意，调用时使用的域名或IP需与当前账号在官网上绑定的域名一致！域名绑定可见：[我的服务->我的账号](http://www.thinkpage.cn/account)

## 本地测试

```bash
$ cd python
$ ls # should has demo-requests.py, demo-urllib.py...
$ python3 demo-requests.py # output fetch result
$ python3 demo-urllib.py # output fetch result
$ python3 demo-jsonp.py # output jsonp url
```
