//
//  WFTableViewRequestModel.m
//  MVC
//
//  Created by fly on 2017/5/11.
//  Copyright © 2017年 fly. All rights reserved.
//

#import "WFTableViewRequestModel.h"
#import "WFTableViewShowModel.h"
#import "AFNetworking.h"
#import "YYModel.h"

@implementation WFTableViewRequestModel

/*网络请求数据，也可以是本地获取（数据、文件）*/
- (void)requestDataSuccess:(void (^)(NSMutableArray *dataArray)) succeess
                   failure:(void (^)(NSString *errorString)) failure {
    
    NSString *URL           = @"https://api.weibo.com/2/statuses/public_timeline.json";
    NSDictionary *parameter = @{ @"access_token": @"2.00NofgBD0L1k4pc584f79cc48SKGdD",
                                 @"count": @"100"
                                 };
    
    AFHTTPSessionManager *sessionManager = [[AFHTTPSessionManager alloc] init];
    [sessionManager GET:URL
             parameters:parameter
               progress:^(NSProgress * _Nonnull uploadProgress) {}
                success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                    [self wf_dictionaryToModel:responseObject success:succeess];
                }
                failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                    failure(error.domain);
                }];
}

/*将请求返回的数据解析给数据模型，推荐使用YYModel
  解析完成后使用调用Block返回给Controller
 */

- (void)wf_dictionaryToModel:(NSDictionary *)dictionary
                     success:(void (^)(NSMutableArray *dataArray)) succeess {
    NSArray *statuses         = dictionary[@"statuses"];
    NSMutableArray <WFTableViewShowModel *>*dataArray = [[NSMutableArray alloc] initWithCapacity:statuses.count];
    for (int i = 0; i < statuses.count; i++) {
        WFTableViewShowModel *showModel = [[WFTableViewShowModel alloc] init];
        showModel.text     = statuses[i][@"text"];
        showModel.userName = statuses[i][@"user"][@"screen_name"];
        showModel.iconURL  = [NSURL URLWithString:statuses[i][@"user"][@"profile_image_url"]];
        [dataArray addObject:showModel];
    }
    succeess(dataArray);
}
@end
