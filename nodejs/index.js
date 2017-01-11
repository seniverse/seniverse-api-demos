
const UID = "U785B76FC9"; // 测试用 用户ID，请更换成您自己的用户ID
const KEY = "4r9bergjetiv1tsd"; // 测试用key，请更换成您自己的 Key
var LOCATION = "Beijing"; // 除拼音外，还可以使用 v3 id、汉语等形式

var Api = require('./lib/api.js')

var api = new Api(UID, KEY);

api.getWeatherNow(LOCATION).then(function(data){
  console.log(JSON.stringify(data, null, 4))
}).catch(function(err) {
  console.log(err.error.status)
});

LOCATION = 'Shanghai';

api.getWeatherNow(LOCATION).then(function(data){
  console.log(JSON.stringify(data, null, 4))
}).catch(function(err) {
  console.log(err.error.status)
});
