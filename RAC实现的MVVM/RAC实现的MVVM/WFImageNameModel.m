//
//  WFImageNameModel.m
//  RAC实现的MVVM
//
//  Created by fly on 2017/5/13.
//  Copyright © 2017年 fly. All rights reserved.
//

#import "WFImageNameModel.h"

@interface WFImageNameModel ()

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation WFImageNameModel


- (void)requestImageName {
    
    /*模拟一个变化的Model，使用NSTimer的Block方法避免引起循环引用、注意加入runloop*/
    __block BOOL flag = 0;
    _timer = [NSTimer scheduledTimerWithTimeInterval:3.0
                                             repeats:YES
                                               block:^(NSTimer *teimer) {
                                                   [self wf_requestImageNameWithFlag:flag];
                                                   if (flag == 0) {
                                                       flag = 1;
                                                   } else {
                                                       flag = 0;
                                                   }
                                               }];
    [[NSRunLoop currentRunLoop] addTimer:_timer
                                 forMode:NSRunLoopCommonModes];
    
}

- (void)wf_requestImageNameWithFlag:(BOOL)flag {
    
    NSString *temp = [NSString stringWithFormat:@"json%d.json", flag];
    NSString *path = [[NSBundle mainBundle] pathForResource:temp ofType:@""];
    NSData *data = [NSData dataWithContentsOfFile:path];
    self.imageDictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:NULL];
}

/*记得停止计时器并置nil*/
- (void)dealloc {
    [_timer invalidate];
    _timer = nil;
}

@end
