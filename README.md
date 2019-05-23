# 心知天气 API 调用示例

[![All Contributors](https://img.shields.io/badge/all_contributors-8-orange.svg?style=flat-square)](#contributors)

请首先查看心知天气的[文档](https://docs.seniverse.com)来了解心知天气 API 的调用方式，以下是一些不同编程语言的示例代码，也欢迎给此项目提 PR 来添加更多不同语言的调用示例，同时也可以向心知天气申请以获得[开发者认证](https://blog.seniverse.com/2290)。

## 代码示例

- [JavaScript](./javascript)

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

- [Java](./java)

- [Swift4](./swift)

- [Object-C](./oc)

- [Common Lisp](./common-lisp)

  - [使用更安全的签名验证方式（荐）](./common-lisp/seniverse-demo.lisp)
  - [cl-seniverse-api ( Lisp SDK )](https://github.com/muyinliu/cl-seniverse-api)

- [Elixir](./elixir)

**注意**：所有代码示例仅做开发参考使用，不要在生产环境下暴露 key！生产环境下请通过后端进行签名验证。

## 常见问题

1. 我在本地调试的时候，如何进行域名绑定？

   本地调试时，请在 [控制台 -> 产品管理](https://www.seniverse.com/account) 的对应产品页面将域名绑定填写为：`127.0.0.1`。若 `127.0.0.1` 在本机无法访问，请注意是否开启了全局代理。

1. 为什么我绑定了 `127.0.0.1` 但访问时报错（没有找到域名，或者报跨域请求的错误，常见于纯前端 API 调用时）？

   **请通过 `127.0.0.1` 的链接，通过 jsonp 的形式访问，而不是 `localhost`，`localhost` 访问会跨域。**

   **请通过 `127.0.0.1` 的链接，通过 jsonp 的形式访问，而不是 `localhost`，`localhost` 访问会跨域。**

   **请通过 `127.0.0.1` 的链接，通过 jsonp 的形式访问，而不是 `localhost`，`localhost` 访问会跨域。**

1. 关于 API 调用问题

   为了保证您账号的安全，**不要纯前端进行 API 调用！**仅仅通过前端调用会造成您的 `uid` 和 `key` 暴露，可能会带来不必要的麻烦。推荐的调用方式有：

   - 后端进行 API 调用获取数据后交给前端渲染
   - 或者后端构造 JSONP 形式的请求链接，交给前端调用

1. 关于 API 调用失败的问题

   可能的原因有：

   - `ts` 时间戳过短
   - `key` 加密后的结果没有通过 Base64 编码
   - 在构造签名的时候，参数的顺序不正确。参与签名的参数有 UNIX 时间戳 `ts`，签名失效时间 `ttl`（单位为秒，缺省为 1800，可选）和公钥 `uid`。请确保：
     1. 参数按照键字典升序排列，例如 `ts=1443079775&ttl=30&uid=U123456789` 或者 `ts=1443079775&uid=U123456789`
     2. `ts` 和 `ttl` 的单位都是秒
   - **Last but not least，请将 demo 内的 API key 等参数替换为自己账户的数据**

## 其他第三方相关项目

- JavaScript
  - [seniverse-jsonp](https://github.com/seanhuai/seniverse-jsonp)

## Contributors

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore -->
<table><tr><td align="center"><a href="https://github.com/muyinliu"><img src="https://avatars0.githubusercontent.com/u/3318872?v=4" width="100px;" alt="muyinliu"/><br /><sub><b>muyinliu</b></sub></a><br /><a href="https://github.com/seniverse/seniverse-api-demos/commits?author=muyinliu" title="Code">💻</a></td><td align="center"><a href="https://www.mokeyjay.com/"><img src="https://avatars0.githubusercontent.com/u/6757507?v=4" width="100px;" alt="mokeyjay"/><br /><sub><b>mokeyjay</b></sub></a><br /><a href="https://github.com/seniverse/seniverse-api-demos/commits?author=mokeyjay" title="Code">💻</a></td><td align="center"><a href="http://cv.flyingant.me/"><img src="https://avatars0.githubusercontent.com/u/1773209?v=4" width="100px;" alt="Liu Cheng a.k.a MaYi"/><br /><sub><b>Liu Cheng a.k.a MaYi</b></sub></a><br /><a href="https://github.com/seniverse/seniverse-api-demos/commits?author=flyingant" title="Code">💻</a></td><td align="center"><a href="https://github.com/wuqingzheng"><img src="https://avatars0.githubusercontent.com/u/11942361?v=4" width="100px;" alt="dazheng_wu"/><br /><sub><b>dazheng_wu</b></sub></a><br /><a href="https://github.com/seniverse/seniverse-api-demos/commits?author=wuqingzheng" title="Code">💻</a></td><td align="center"><a href="https://github.com/hewiez"><img src="https://avatars0.githubusercontent.com/u/26524421?v=4" width="100px;" alt="hewieZ"/><br /><sub><b>hewieZ</b></sub></a><br /><a href="https://github.com/seniverse/seniverse-api-demos/commits?author=hewiez" title="Code">💻</a></td><td align="center"><a href="https://github.com/weishuaigithub"><img src="https://avatars1.githubusercontent.com/u/21059908?v=4" width="100px;" alt="weishuaigithub"/><br /><sub><b>weishuaigithub</b></sub></a><br /><a href="https://github.com/seniverse/seniverse-api-demos/commits?author=weishuaigithub" title="Code">💻</a></td><td align="center"><a href="http://weibo.com/longwosion"><img src="https://avatars0.githubusercontent.com/u/203458?v=4" width="100px;" alt="Eric SHI"/><br /><sub><b>Eric SHI</b></sub></a><br /><a href="#maintenance-longwosion" title="Maintenance">🚧</a></td></tr><tr><td align="center"><a href="https://hacknical.com"><img src="https://avatars0.githubusercontent.com/u/10706318?v=4" width="100px;" alt="ecmadao"/><br /><sub><b>ecmadao</b></sub></a><br /><a href="#maintenance-ecmadao" title="Maintenance">🚧</a></td><td align="center"><a href="http://maples7.com/"><img src="https://avatars0.githubusercontent.com/u/9960982?v=4" width="100px;" alt="Maples7"/><br /><sub><b>Maples7</b></sub></a><br /><a href="#maintenance-Maples7" title="Maintenance">🚧</a></td></tr></table>
<!-- ALL-CONTRIBUTORS-LIST:END -->
