# PHP 调用 API 实例

## 使用更安全的签名验证方式（荐）

具体签名方式可以参考：[demo-jsonp.php](./demo-jsonp.php)，直接运行文件将会输出最终应该调用的 URL

之后将该 URL 传递至前端通过 JSONP 进行调用，或在后端 server 内调用

> 但需注意，**调用时使用的域名或IP需与当前账号在官网上绑定的域名一致！**域名绑定可见：[我的服务->我的账号](http://www.thinkpage.cn/account)
