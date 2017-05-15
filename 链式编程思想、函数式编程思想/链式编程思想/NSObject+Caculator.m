//
//  NSObject+Caculator.m
//  链式编程思想
//
//  Created by fly on 2017/5/6.
//  Copyright © 2017年 fly. All rights reserved.
//

#import "NSObject+Caculator.h"
#import "WFCaculatorMaker.h"

@implementation NSObject (Caculator)

+ (int)makeCaculators: (void (^)(WFCaculatorMaker *make))block {
    
    WFCaculatorMaker *cm = [[WFCaculatorMaker alloc] init];
    block(cm);
    return cm.resault;
    
}

@end
