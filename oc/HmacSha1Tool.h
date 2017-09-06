#import <Foundation/Foundation.h>

@interface HmacSha1Tool : NSObject

+ (NSString *)HmacSha1Key:(NSString *)key data:(NSString *)data;
@end
