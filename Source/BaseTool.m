//
//  BaseTool.m
//  TradeBook
//
//  Created by kim on 2022/8/23.
//

#import "BaseTool.h"

@implementation BaseTool
// 获取当前版本号
+ (NSString*)getCurrentVersion{
    NSDictionary *dicBundle = [[NSBundle mainBundle] infoDictionary];
    // 获取当前软件版本
    NSString *currVersion = [dicBundle objectForKey:@"CFBundleShortVersionString"];
    return currVersion;
}
@end
