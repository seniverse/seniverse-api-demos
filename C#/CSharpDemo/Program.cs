using System;
using System.Collections.Generic;
using System.Security.Cryptography;
using Newtonsoft.Json.Linq;
using RestSharp;

namespace CSharpDemo
{
    public class Program
    {
        public static RestClient Client { get; set; } = new RestClient("https://api.seniverse.com/");
        /// <summary>
        /// 在这里填入你的密钥
        /// </summary>
        public static string PrivateKey { get; set; } = "your PrivateKey";
        /// <summary>
        /// 在这里填入你的公钥
        /// </summary>
        public static string PublicKey { get; set; } = "your PublicKey";
        public static string Api { get; set; } = "v3/weather/daily.json";
        public static string Location { get; set; } = "beijing";
        public static string Language { get; set; } = "zh-Hans";
        public static string Unit { get; set; } = "c";
        public static string Start { get; set; } = "0";
        public static string Days { get; set; } = "2";
        public static string TimeStamp { get; set; }

        /// <summary>
        /// 签名失效时间
        /// </summary>
        public static string ttl { get; set; } = "1800";
        static void Main(string[] args)
        {
            var response = GetWeatherInfoBySign();
            //解析需要的数据
            var weatherModels = JObject.Parse(response).SelectToken("results").First.
                SelectToken("daily").ToObject<List<WeatherModel>>();
        }
        /// <summary>
        /// 用私钥获取天气信息
        /// </summary>
        /// <returns></returns>
        private static string GetWeatherInfo()
        {
            var request = BuildRestRequest();
            request.AddQueryParameter("key", PrivateKey);
            var response = Client.Execute(request).Content;
            return response;
        }
        /// <summary>
        /// 通过签名获取天气信息
        /// </summary>
        /// <returns></returns>
        private static string GetWeatherInfoBySign()
        {
            var request = BuildRestRequest();
            request.AddQueryParameter("sig", CreateSign());
            request.AddQueryParameter("ts", TimeStamp);
            request.AddQueryParameter("ttl", ttl);
            request.AddQueryParameter("uid", PublicKey);
            
            var response = Client.Execute(request).Content;
            return response;
        }

        private static RestRequest BuildRestRequest()
        {
            RestRequest request = new RestRequest(Api);
            
            request.AddQueryParameter("location", Location);
            request.AddQueryParameter("language", Language);
            request.AddQueryParameter("unit", Unit);
            request.AddQueryParameter("start", Start);
            request.AddQueryParameter("days", Days);
            return request;
        }
        /// <summary>
        /// 构造签名
        /// </summary>
        /// <returns></returns>
        public static string CreateSign()
        {
            TimeStamp = GetTimeStamp();
            string queryString = $"ts={TimeStamp}&ttl={ttl}&uid={PublicKey}";
            return HMACSHA1Text(queryString, PrivateKey);
        }
        /// <summary>
        /// 获取时间戳
        /// </summary>
        /// <param name="bflag">false时是13位</param>
        /// <returns></returns>
        public static string GetTimeStamp(bool bflag=true)
        {
            TimeSpan ts = DateTime.UtcNow - new DateTime(1970, 1, 1, 0, 0, 0, 0);
            string ret = string.Empty;
            if (bflag)
                ret = Convert.ToInt64(ts.TotalSeconds).ToString();
            else
                ret = Convert.ToInt64(ts.TotalMilliseconds).ToString();

            return ret;
        }
        /// <summary>
        /// HMACSHA1加密，返回base64
        /// </summary>
        /// <param name="text">要加密的原串</param>
        ///<param name="key">私钥</param>
        /// <returns></returns>
        public static string HMACSHA1Text(string text, string key)
        {
            //HMACSHA1加密
            HMACSHA1 hmacsha1 = new HMACSHA1();
            hmacsha1.Key = System.Text.Encoding.UTF8.GetBytes(key);

            byte[] dataBuffer = System.Text.Encoding.UTF8.GetBytes(text);
            byte[] hashBytes = hmacsha1.ComputeHash(dataBuffer);

            return Convert.ToBase64String(hashBytes);

        }
    }
    /// <summary>
    /// 在这里我只解析了关心的数据，大家可按需要把字段都解析出来
    /// </summary>

    public class WeatherModel
    {
        public DateTime date { get; set; }
        public string text_day { get; set; }
        public double high { get; set; }
        public double low { get; set; }
    }
}
