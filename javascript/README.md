# Javascript 调用 API 示例

> [查看自己的用户ID 和 API key](http://www.seniverse.com/doc#info)

> 注：本示例仅做开发参考使用，不建议在生产环境下暴露 key！

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

#### 直接发送 GET 请求

> 详细代码可见：[Seniverse API Test](./index.html)

```javascript
// 该 Api url 可获取天气实况。用户可替换为其他 url 进行测试
var API = "http://api.seniverse.com/v3/weather/now.json?location=beijing&";
var url = API + str + "&callback=?";
$.getJSON(url)
```

#### 通过 JSONP 的形式调用

> 详细代码可见：[Seniverse API JSONP Test](./jsonp.html)

```javascript
// 该 Api url 可获取天气实况。用户可替换为其他 url 进行测试
var API = "http://api.seniverse.com/v3/weather/now.json?location=beijing&";
var jsonpCallback = function(result) {
  // result 为回调函数
  // 用户在这里处理返回的结果
}

var url = API + str + "&callback=jsonpCallback";

// 向 HTML 中动态插入 script 标签，通过 JSONP 的方式进行调用
var newScript = document.createElement('script');
newScript.type = 'text/javascript';
newScript.src = url;
$('body').append(newScript);
```

## 本地启动本示例

需要起本地 server, 测试中使用的 key 和 uid 绑定的域名是127.0.0.1.

```bash
$ npm install http-server -g
$ cd seniverse-api-demos/javascript
$ http-server -p 3333
```

打开浏览器访问

- `http://127.0.0.1:3333/jsonp`

*注：请通过 `127.0.0.1` 的链接访问 `/jsonp`，而不是 `localhost`，`localhost` 访问会跨域！！！*

*注：请通过 `127.0.0.1` 的链接访问 `/jsonp`，而不是 `localhost`，`localhost` 访问会跨域！！！*

*注：请通过 `127.0.0.1` 的链接访问 `/jsonp`，而不是 `localhost`，`localhost` 访问会跨域！！！*

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
