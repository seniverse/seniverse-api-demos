# 心知天气 API 调用示例

> 举例说明心知天气 API 的基本调用方法

**注： 心知天气官网正式启用新域名：[www.seniverse.com](//www.seniverse.com) ，因此本项目由 thinkpage-api-demos 改名为 seniverse-api-demos**

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

- Swift

- [Common Lisp](./common-lisp)

  - [使用更安全的签名验证方式（荐）](./common-lisp/seniverse-demo.lisp)
  - [cl-seniverse-api ( Lisp SDK )](https://github.com/muyinliu/cl-seniverse-api)

## Contributors

- [flyingant](https://github.com/flyingant)
- [muyinliu](https://github.com/muyinliu)
- [mokeyjay](https://github.com/mokeyjay)
- [ecmadao](https://github.com/ecmadao)
