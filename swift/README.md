# Swift4 调用 API 示例

Swift4 通过发送网络请求进行 API 的调用

## 使用方式

> 本项目依赖 CommonCrypto 进行 HMAC 加密

1. 下载项目，在 XCode 中导入
2. 下载`CommonCrypto`，可以在 [GitHub - CommonCrypto](https://github.com/soffes/CommonCrypto) 下载源码后，导入`CommonCrypto.xcodeproj` 文件
3. 运行项目
4. 如需更改城市，则请修改 `main.swift` 文件中的 `SeniverseAPI.fetchWeatherNow(location: "Beijing")`，可直接替换为拼音、汉字、城市 V3 ID 或者经纬度
