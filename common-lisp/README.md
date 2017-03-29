# Common Lisp 调用 API 示例

使用库 `drakma` 发送 HTTP 请求进行 API 的调用

## 使用更安全的签名验证方式（荐）

使用以下库进行签名：

- cl-base64
- ironclad
- flexi-streams

### Requirements

- CL implementation installed(eg. SBCL, CCL or LispWorks)
- Quicklisp installed

### Prepare

```shell
$ git clone https://github.com/seniverse/seniverse-api-demos.git
$ ln -s api-demos/common-lisp/ ~/quicklisp/local-projects/seniverse-demo
```

### Run

```shell
$ sbcl
```

注：这里使用 [SBCL](http://sbcl.org) 作为运行环境

```lisp
(ql:quickload 'seniverse-demo)
```

示例输出结果：

```
{"results":[{"location":{"id":"WX4FBXXFKE4F","name":"北京","country":"CN","path":"北京,北京,中国","timezone":"Asia/Shanghai","timezone_offset":"+08:00"},"now":{"text":"多云","code":"4","temperature":"4","feels_like":"3","pressure":"1024","humidity":"53","visibility":"2.0","wind_direction":"东南","wind_direction_degree":"117","wind_speed":"3.6","wind_scale":"1","clouds":"","dew_point":""},"last_update":"2017-02-14T15:45:00+08:00"}]}
200
```
