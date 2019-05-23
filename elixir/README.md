# Elixir

[Elixir 代码示例](./lib/seniverse_demo.ex)调用心知天气 API。

## Usage

```sh
$ mix deps.get
$ iex -S mix
iex> SeniverseDemo.call
%HTTPotion.Response{
  body: "{\"results\":[{\"location\":{\"id\":\"WX4FBXXFKE4F\",\"name\":\"北京\",\"country\":\"CN\",\"path\":\"北京,北京,中国\",\"timezone\":\"Asia/Shanghai\",\"timezone_offset\":\"+08:00\"},\"now\":{\"text\":\"晴\",\"code\":\"1\",\"temperature\":\"31\",\"feels_like\":\"29\",\"pressure\":\"998\",\"humidity\":\"30\",\"visibility\":\"22.2\",\"wind_direction\":\"南\",\"wind_direction_degree\":\"172\",\"wind_speed\":\"2.88\",\"wind_scale\":\"1\",\"clouds\":\"0\",\"dew_point\":\"\"},\"last_update\":\"2019-05-23T19:45:00+08:00\"}]}",
  headers: %HTTPotion.Headers{
    hdrs: %{
      "connection" => "keep-alive",
      "content-length" => "445",
      "content-type" => "application/json; charset=utf-8",
      "date" => "Thu, 23 May 2019 12:27:32 GMT",
      "etag" => "W/\"1bd-ojnI4rY/zCqBbv6XKFwbE+gTEZA\"",
      "via" => "kong/0.14.1",
      "x-instance-id" => "2sdsdfsf-7e51-4n18-be57-s42vc847d269",
      "x-kong-proxy-latency" => "9",
      "x-kong-upstream-latency" => "1",
      "x-powered-by" => "Express"
    }
  },
  status_code: 200
}
```

查看 [HTTPotion 文档](https://hexdocs.pm/httpotion/readme.html) 以了解更多关于这个 Elixir 的 HTTP 客户端的用法。

## Test

```sh
$ mix test
..

Finished in 0.06 seconds
2 doctests, 0 failures

Randomized with seed 925123
```
