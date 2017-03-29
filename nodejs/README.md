# Node.js 调用 API 实例

## 使用更安全的签名验证方式（荐）

进行签名验证的过程可见代码: [lib/api.js](./lib/api.js)

> 但需注意，**调用时使用的域名或IP需与当前账号在官网上绑定的域名一致！**域名绑定可见：[我的服务->我的账号](http://www.seniverse.com/account)

## 本地运行

```bash
$ npm install
# 修改 index.js 文件中的 UID 和 KEY

# 获取北京实况天气
$ node index.js

# 获取厦门实况天气
$ node index.js -l xiamen
$ node index.js -l 厦门
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
