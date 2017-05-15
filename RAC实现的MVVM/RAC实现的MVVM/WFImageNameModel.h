//
//  WFImageNameModel.h
//  RAC实现的MVVM
//
//  Created by fly on 2017/5/13.
//  Copyright © 2017年 fly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WFImageNameModel : NSObject

@property(nonatomic, strong) NSDictionary *imageDictionary;

- (void)requestImageName;

@end
