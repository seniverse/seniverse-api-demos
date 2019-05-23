# 心知天气 API 调用示例

> 举例说明心知天气 API 的基本调用方法

**注： 心知天气官网正式启用新域名：[www.seniverse.com](//www.seniverse.com) ，因此本项目由 thinkpage-api-demos 改名为 seniverse-api-demos**

## 目录

- [Javascript](./javascript) **本示例仅做开发参考使用，不建议在生产环境下暴露 key！生产环境下请通过后端进行签名验证**

  - [直接调用](./javascript/index.html)
  - [JSONP](./javascript/jsonp.html)

- [Node.js](./nodejs)

  - [使用更安全的签名验证方式（荐）](./nodejs/lib/api.js)

- [Python](./python)

  - 直接调用

    - [urllib](./python/demo-urllib.py)
    - [requests](./python/demo-requests.py)

  - [使用更安全的签名验证方式（荐）](./python/demo-jsonp.py)

- [PHP](./php)

  - [使用更安全的签名验证方式（荐）](./php/demo-jsonp.php)
  - [PHP demo, contributed by open source community](./php/demo.php)

- Android

  - ~~可直接使用已封装好的 [Android SDK](https://github.com/seniverse/ThinkPageSDK_Android)~~ **注：该 SDK 已停止维护，不建议使用**
  - 或自主发起 http 请求，进行 API 调用

- Ruby

- [Java](./java)

- [Swift4](./swift)

- [Object-C](./oc)

- [Common Lisp](./common-lisp)

  - [使用更安全的签名验证方式（荐）](./common-lisp/seniverse-demo.lisp)
  - [cl-seniverse-api ( Lisp SDK )](https://github.com/muyinliu/cl-seniverse-api)

## 常见问题

1. 我在本地调试的时候，如何进行域名绑定？

本地调试时，请在 [我的账号 -> 我的服务](https://www.seniverse.com/account) 页面填写域名为：`127.0.0.1`。若 `127.0.0.1` 在本机无法访问，请注意是否开启了全局代理。

2. 为什么我绑定了 `127.0.0.1` 但访问时报错（没有找到域名，或者报跨域请求的错误）？（常见于纯前端 API 调用时）

**请通过 `127.0.0.1` 的链接，通过 jsonp 的形式访问，而不是 `localhost`，`localhost` 访问会跨域**

**请通过 `127.0.0.1` 的链接，通过 jsonp 的形式访问，而不是 `localhost`，`localhost` 访问会跨域**

**请通过 `127.0.0.1` 的链接，通过 jsonp 的形式访问，而不是 `localhost`，`localhost` 访问会跨域**

3. 关于 API 调用问题

为了保证您账号的安全，不建议纯前端进行 API 调用！仅仅通过前端调用会造成您的 UID 和 Key 暴露，可能会带来不必要的麻烦。推荐的调用方式有：

- 后端进行 API 调用获取数据后交给前端渲染
- 或者后端构造 JSONP 形式的请求链接，交给前端调用

4. 关于 API 调用失败的问题

可能的原因有：

- ts 时间戳过短
- Key 加密后的结果没有通过 Base64 编码
- 在构造签名的时候，参数的顺序不正确！参与签名的参数有 UNIX 时间戳`ts`，签名失效时间`ttl`（单位为秒，缺省为 1800，可选）和用户 ID`uid`。请确保：
  1. 参数按照键字典升序排列，例如`ts=1443079775&ttl=30&uid=U123456789`或者`ts=1443079775&uid=U123456789`
  2. `ts`和`ttl`的单位都是秒
- **Last but not least，请将 demo 内的 API key 等参数替换为自己账户的数据**

## Third party modules

- Javascript
  - [seniverse-jsonp](https://github.com/seanhuai/seniverse-jsonp)

## Contributors

- [weishuaigithub](https://github.com/weishuaigithub)
- [hewiez](https://github.com/hewiez)
- [wuqingzheng](https://github.com/wuqingzheng)
- [flyingant](https://github.com/flyingant)
- [muyinliu](https://github.com/muyinliu)
- [mokeyjay](https://github.com/mokeyjay)
- [ecmadao](https://github.com/ecmadao)
