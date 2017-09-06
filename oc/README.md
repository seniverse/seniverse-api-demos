# 心知天气 API 调用示例 Objective-C

#### Demo 运行方法
Xcode 新建一个项目，将`HmacSha1Tool.h`, `HmacSha1Tool.m`, `ViewController.h`, `ViewController.m`四个文件拷贝到项目中（`ViewController.h`, `ViewController.m`直接替换），直接运行即可查看天气实况，如果想查看心知天气其他 API，可在 `ViewController.m` 文件中把 `viewDidLoad` 方法里面的`TIANQI_NOW_WEATHER_URL`替换为你想查看的URL即可。


#### 注意
本项目未做默认值为空校验，实际开发需做好校验。
