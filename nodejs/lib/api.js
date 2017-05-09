

/**
 * Module denpendencies
 */
var crypto = require('crypto');
var querystring = require('querystring');
var request = require('request-promise');

var URL = 'https://api.seniverse.com/v3/';

function Api(uid, secretKey) {
  this.uid = uid;
  this.secretKey = secretKey;
}

Api.prototype.getSignatureParams = function() {

  var params = {}
  params.ts = Math.floor((new Date()).getTime() /1000); // 当前时间戳
  params.ttl = 300; // 过期时间
  params.uid = this.uid; // 用户ID

  var str = querystring.encode(params); // 构造请求字符串

  // 使用 HMAC-SHA1 方式，以API密钥（key）对上一步生成的参数字符串进行加密
  params.sig = crypto.createHmac('sha1', this.secretKey)
    .update(str)
    .digest('base64'); // 将加密结果用 base64 编码，并做一个 urlencode，得到签名 sig

  return params;
}

Api.prototype.getWeatherNow = function(location) {
  var params = this.getSignatureParams();
  params.location = location;

  // 将构造的 URL 直接在后端 server 内调用
  return request({
    url: URL + 'weather/now.json',
    qs : params,
    json : true
  });
}


module.exports = Api;
