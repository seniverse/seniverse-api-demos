<?php
$location = "Beijing"; // 除拼音外，还可以使用 v3 id、汉语等形式
$key = "4r9bergjetiv1tsd"; // 测试用 key，请更换成您自己的 Key
$uid = "U785B76FC9"; // 测试用 用户ID，请更换成您自己的用户ID

// 获取当前时间戳，并构造验证参数字符串
$keyname = "ts=".time()."&ttl=300&uid=".$uid;

echo "\n";
echo $keyname;

// 使用 HMAC-SHA1 方式，以 API 密钥（key）对上一步生成的参数字符串（raw）进行加密
$sig = base64_encode(hash_hmac('sha1', $keyname, $key, true));

echo "\n";
echo $sig;

// 将上一步生成的加密结果用 base64 编码，并做一个 urlencode，得到签名sig
$signedkeyname = $keyname."&sig=".urlencode($sig);

// 最终构造出可由前端或服务端进行调用的 url
$url = "https://api.seniverse.com/v3/weather/now.json?location=".$location."&".$signedkeyname;

echo "\n";
echo $url;
