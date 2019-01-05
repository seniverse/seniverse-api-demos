#import "ViewController.h"
#import "HmacSha1Tool.h"

@interface ViewController ()
@end

@implementation ViewController

#pragma mark - API KEY / USER ID

static NSString *TIANQI_API_SECRET_KEY = @"xkojmyi74gj0kjgi";   // YOUR API KEY
static NSString *TIANQI_API_USER_ID = @"U0E4A68FBD";            // YOUR USER ID

#pragma mark - 天气、生活、位置接口（这里只测试了免费接口，付费接口未做测试）

//---------------------- 天气 ----------------------
static NSString *TIANQI_DAILY_WEATHER_URL = @"https://api.seniverse.com/v3/weather/daily.json";     //逐日天气预报和昨日天气 URL
static NSString *TIANQI_NOW_WEATHER_URL = @"https://api.seniverse.com/v3/weather/now.json";         //天气实况 URL

//---------------------- 生活 ----------------------
static NSString *TIANQI_LIFE_SUGGESTION_URL = @"https://api.seniverse.com/v3/life/suggestion.json"; //生活指数 URL

- (void)viewDidLoad {
    [super viewDidLoad];

    // 创建 session 对象
    NSURLSession *session = [NSURLSession sharedSession];
    NSString * nameStr  = @"济宁";//输入汉字 区别“集宁”，使用拼音则会造成混乱
    NSString *dataUTF8 = [nameStr stringByAddingPercentEncodingWithAllowedCharacters:(NSCharacterSet * )NSUTF8StringEncoding];
    NSString *urlStr = [self fetchWeatherWithURL:TIANQI_LIFE_SUGGESTION_URL //TIANQI_NOW_WEATHER_URL
                                             ttl:@30
                                        Location:dataUTF8//查询位置需要对汉字进行转码，不然会有地名重复
                                        language:@"zh-Hans"//zh-Hans 简体中文
                                            unit:@"c"//单位 当参数为c时，温度c、风速km/h、能见度km、气压mb;当参数为f时，温度f、风速mph、能见度mile、气压inch
                                           start:@"1"
                                            days:@"1"];
    NSURL *url = [NSURL URLWithString:urlStr];
    // 通过 URL 初始化 task,在 block 内部可以直接对返回的数据进行处理
    NSURLSessionTask *task = [session dataTaskWithURL:url
                                    completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                    NSLog(@"输出:%@",[self dictionaryToJson: [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil]] );                                    }];

    // 启动任务
    [task resume];
}

//字典转json格式字符串：xcode9  以后大部分转码插件扑街了，所以手动转码。
- (NSString*)dictionaryToJson:(NSDictionary *)dic
{
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}
/**
 配置带请求参数的 url 地址。

 @param url 需要请求的 url 地址。 例如：获取指定城市的天气实况 url 为 TIANQI_NOW_WEATHER_URL
 @param ttl 签名失效时间(可选)，默认有效期为 1800 秒（30分钟）
 @param location 所查询的位置
 @param language 语言(可选)。 默认值：zh-Hans
 @param unit 单位 (可选)。默认值：c
 @param start 起始时间 (可选)。默认值：0
 @param days 天数 (可选)。 默认为你的权限允许的最多天数
 @return return 带请求参数的 url 地址
 */
- (NSString *)fetchWeatherWithURL:(NSString *)url ttl:(NSNumber *)ttl Location:(NSString *)location
                         language:(NSString *)language unit:(NSString *)unit
                            start:(NSString *)start days:(NSString *)days{
    NSString *timestamp = [NSString stringWithFormat:@"%.0ld",time(NULL)];
    NSString *params = [NSString stringWithFormat:@"ts=%@&ttl=%@&uid=%@", timestamp, ttl, TIANQI_API_USER_ID];
    NSString *signature =  [self getSigntureWithParams:params];

    NSString *urlStr = [NSString stringWithFormat:@"%@?%@&sig=%@&location=%@&language=%@&unit=%@&start=%@&days=%@",
                        url, params, signature, location, language, unit, start, days];
    return urlStr;
}

/**
 获得签名字符串，关于如何使用签名验证方式，详情见 https://www.seniverse.com/doc#sign

 @param params 验证参数字符串
 @return signature HMAC-SHA1 加密后得到的签名字符串
 */
- (NSString *)getSigntureWithParams:(NSString *)params{
    NSString *signature = [HmacSha1Tool HmacSha1Key:TIANQI_API_SECRET_KEY data:params];
    return signature;
}

@end
