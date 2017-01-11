

/**
 * Module denpendencies
 */
var crypto = require('crypto');
var querystring = require('querystring');
var request = require('request-promise');

var URL = 'https://api.thinkpage.cn/v3/';

function Api(uid, secretKey) {
  this.uid = uid;
  this.secretKey = secretKey;
}

Api.prototype.getSignatureParams = function() {

  var params = {}
  params.ts = Math.floor((new Date()).getTime() /1000);
  params.ttl = 300
  params.uid = this.uid

  var str = querystring.encode(params);

  params.sig = crypto.createHmac('sha1', this.secretKey)
    .update(str)
    .digest('base64')

  return params
}

Api.prototype.getWeatherNow = function(location) {
  var params = this.getSignatureParams();
  params.location = location;

  return request({
    url: URL + 'weather/now.json',
    qs : params,
    json : true
  })
}


module.exports = Api;
