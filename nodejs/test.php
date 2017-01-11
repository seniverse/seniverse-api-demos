<?php
$location = "Beijing";
$key = "qvbt7jgw87gbvseo";
$uid = "UEBACC6EE1";

$keyname = "ts=".time()."&ttl=30&uid=".$uid;

echo "\n";
echo $keyname;

$sig = base64_encode(hash_hmac('sha1', $keyname, $key, true));

echo "\n";
echo $sig;

$signedkeyname = $keyname."&sig=".urlencode($sig);

$url = "https://api.thinkpage.cn/v3/weather/now.json?location=".$location."&".$signedkeyname;

echo "\n";
echo $url;

