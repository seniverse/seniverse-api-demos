# Javascript 调用 API 示例

> [查看自己的用户ID 和 API key](http://www.thinkpage.cn/doc#info)

> 注：本示例仅做开发参考使用，不建议在生产环节下暴露 key！

## 基本步骤

### 构造验证参数字符串

#### 参数说明

- UNIX 时间戳（秒）
- uid 用户ID
- ttl 签名失效时间（可选）

使用上述参数构造参数字符串，例如：

```javascript
var UID = "UEBACC6EE1";
var ts = Math.floor((new Date()).getTime() / 1000);
var str = "ts="+ts+"&uid=" + UID; // 参数字符串
```

### 加密

使用 HMAC-SHA1 方式，以API密钥（key）对上一步生成的参数字符串进行加密

```javascript
// ...
var str = "ts="+ts+"&uid=" + UID;

var KEY = "qvbt7jgw87gbvseo";
var result = CryptoJS.HmacSHA1(str, KEY);
```

### 编码

将上一步生成的加密结果用 base64 编码，并做一个 urlencode，得到签名 sig

```javascript
var sig = result.toString(CryptoJS.enc.Base64);
str = str + "&sig=" + sig; // 最终构造的已加密的参数字符串
```

### 发送请求

```javascript
// 该 Api url 可获取天气实况。用户可替换为其他 url 进行测试
var API = "http://api.thinkpage.cn/v3/weather/now.json?location=beijing&";
var url = API + str + "&callback=?";
$.getJSON(url)
```

## 本地启动本示例

需要起本地 server, 测试中使用的key和uid绑定的域名是127.0.0.1.

```bash
$ npm install http-server -g
$ cd thinkpage-api-js
$ http-server -p 3333
```

打开浏览器访问`http://127.0.0.1:3333/`
