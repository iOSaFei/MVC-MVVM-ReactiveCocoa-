//
//  ViewController.m
//  链式编程思想
//
//  Created by fly on 2017/5/6.
//  Copyright © 2017年 fly. All rights reserved.
//

#import "ViewController.h"
#import "WFCaculatorMaker.h"
#import "NSObject+Caculator.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*链式编程思想*/
    int res = [NSObject makeCaculators:^(WFCaculatorMaker *maker){
        maker.add(1).add(2).add(3);
    }];
    NSLog(@"%d", res);
    
    /*函数式编程思想*/
    WFCaculatorMaker *maker = [[WFCaculatorMaker alloc] init];
    BOOL isEqual = [[[maker caculator:^(int resault){
        resault += 2;
        resault *= 5;
        return resault;
    }] equal:^BOOL(int resault) {
        return (resault == 10);
    }] isEqual];
    NSLog(@"%d", isEqual);

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
