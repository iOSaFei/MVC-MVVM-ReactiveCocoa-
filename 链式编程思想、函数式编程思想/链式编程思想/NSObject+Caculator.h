//
//  NSObject+Caculator.h
//  链式编程思想
//
//  Created by fly on 2017/5/6.
//  Copyright © 2017年 fly. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WFCaculatorMaker;
@interface NSObject (Caculator)

+ (int)makeCaculators: (void (^)(WFCaculatorMaker *make))block;

@end
