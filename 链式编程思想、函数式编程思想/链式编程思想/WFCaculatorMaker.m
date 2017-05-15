//
//  WFCaculatorMaker.m
//  链式编程思想
//
//  Created by fly on 2017/5/6.
//  Copyright © 2017年 fly. All rights reserved.
//

#import "WFCaculatorMaker.h"

@implementation WFCaculatorMaker

- (WFCaculatorMaker *(^)(int))add
{
    return ^(int value)
    {
        _resault += value;
        return self;
    };
}

- (WFCaculatorMaker *)sub:(int) a {
    _resault -= a;
    return self;
}

- (WFCaculatorMaker *)test {
    return nil;
}



- (WFCaculatorMaker *)caculator:(int (^)(int resault))caculator {
    _resault1 = caculator(_resault1);
    return self;
}
- (WFCaculatorMaker *)equal:(BOOL (^)(int resault))operation{
    _isEqual = operation(_resault1);
    return self;
}
@end
