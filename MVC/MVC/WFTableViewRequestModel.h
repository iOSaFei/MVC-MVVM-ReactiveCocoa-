//
//  WFTableViewRequestModel.h
//  MVC
//
//  Created by fly on 2017/5/11.
//  Copyright © 2017年 fly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WFTableViewRequestModel : NSObject

- (void)requestDataSuccess:(void (^)(NSMutableArray *dataArray)) succeess
                   failure:(void (^)(NSString *errorString)) failure;

@end
