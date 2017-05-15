//
//  WFCaculatorMaker.h
//  链式编程思想
//
//  Created by fly on 2017/5/6.
//  Copyright © 2017年 fly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WFCaculatorMaker : NSObject

@property (nonatomic, assign) int resault;
@property (nonatomic, assign) int resault1;
@property (nonatomic, assign) BOOL isEqual;


/*响应式*/

- (WFCaculatorMaker * (^) (int))add;


- (WFCaculatorMaker *)sub : (int) a;

- (WFCaculatorMaker *)test;

/*函数式*/
- (WFCaculatorMaker *)caculator:(int (^)(int resault))caculator;
- (WFCaculatorMaker *)equal:(BOOL (^)(int resault))operation;
@end
