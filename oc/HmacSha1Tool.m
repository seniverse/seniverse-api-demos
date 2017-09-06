#import "HmacSha1Tool.h"
#import <CommonCrypto/CommonHMAC.h>
@implementation HmacSha1Tool

/**
 通过 HMAC-SHA1，对请求参数字符串进行加密，得到一个签名字符串。

 @param key 你的 API 密钥
 @param data 请求参数字符串
 @return 签名字符串 sig
 */
+ (NSString *)HmacSha1Key:(NSString *)key data:(NSString *)data {
    const char *cKey  = [key cStringUsingEncoding:NSASCIIStringEncoding];
    const char *cData = [data cStringUsingEncoding:NSASCIIStringEncoding];

    // HmacSHA1 加密
    unsigned char cHMAC[CC_SHA1_DIGEST_LENGTH];
    CCHmac(kCCHmacAlgSHA1, cKey, strlen(cKey), cData, strlen(cData), cHMAC);
    NSData *HMAC = [[NSData alloc] initWithBytes:cHMAC
                                          length:sizeof(cHMAC)];

    //将加密结果进行一次 BASE64 编码。
    NSString *hash = [HMAC base64EncodedStringWithOptions:0];

    //将 BASE64 编码结果做一个 urlencode
    NSString *charactersToEscape = @"?!@#$^&%*+,:;='\"`<>()[]{}/\\| ";
    NSCharacterSet *allowedCharacters = [[NSCharacterSet characterSetWithCharactersInString:charactersToEscape] invertedSet];
    NSString *encodedUrl = [hash stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacters];

    //得到签名 sig
    return encodedUrl;
}

@end
