# Python3 调用 API 示例

Python3 通过发送网络请求进行 API 的调用

## 直接调用

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

使用 https 的 API 时，直接调用 urllib 进行请求会报错：`urllib.error.URLError: <urlopen error [SSL: CERTIFICATE_VERIFY_FAILED] certificate verify failed (_ssl.c:646)>`，需要我们引用`ssl`库进行配置

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

## 使用更安全的签名验证方式（荐）

使用官方标准库进行签名：

- time
- hashlib
- hmac
- base64
- urllib

具体签名方式可以参考：[demo-jsonp.py](./demo-jsonp.py)，直接运行文件将会输出最终应该调用的 URL，该 URL 可由传递至前端进行调用，也可以在后端 server 内调用

> 但需注意，**调用时使用的域名或IP需与当前账号在官网上绑定的域名一致！**域名绑定可见：[我的服务->我的账号](http://www.seniverse.com/account)

## 本地测试

```bash
$ cd python
$ ls # should has demo-requests.py, demo-urllib.py...

# 获取默认地址实况天气（北京）
$ python3 demo-requests.py
$ python3 demo-urllib.py
# 获取厦门实况天气
$ python3 demo-requests.py xiamen
$ python3 demo-requests.py 厦门
$ python3 demo-urllib.py xiamen
$ python3 demo-urllib.py 厦门

# 获取 jsonp url
$ python3 demo-jsonp.py # 北京
$ python3 demo-requests.py xiamen # 厦门
```

## 参数说明

### 所查询的位置

查询的城市支持如下参数形式：

- 城市ID 例如：`location=WX4FBXXFKE4F`
- 城市中文名 例如：`location=北京`
- 省市名称组合 例如：`location=辽宁朝阳`、`location=北京朝阳`
- 城市拼音/英文名 例如：`location=beijing`（如拼音相同城市，可在之前加省份和空格，例：shanxi yulin）
- 经纬度 例如：`location=39.93:116.40`（纬度前经度在后，冒号分隔）
- IP地址 例如：`location=220.181.111.86`（某些IP地址可能无法定位到城市）
- "ip"两个字母 自动识别请求IP地址，例如：`location=ip`
