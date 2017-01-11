

var Api = require('./lib/api.js')

var api = new Api('UEBACC6EE1', 'qvbt7jgw87gbvseo');

api.getWeatherNow('Beijing').then(function(data){
  console.log(JSON.stringify(data, null, 4))
}).catch(function(err) {
  console.log(err.error.status)
})

api.getWeatherNow('Shanghai').then(function(data){
  console.log(JSON.stringify(data, null, 4))
}).catch(function(err) {
  console.log(err.error.status)
})



