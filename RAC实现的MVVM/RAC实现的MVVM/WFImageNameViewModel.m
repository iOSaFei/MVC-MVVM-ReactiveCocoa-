//
//  WFImageNameViewModel.m
//  RAC实现的MVVM
//
//  Created by fly on 2017/5/13.
//  Copyright © 2017年 fly. All rights reserved.
//

#import "WFImageNameViewModel.h"
#import "ReactiveObjC.h"
#import "WFImageNameModel.h"

@interface WFImageNameViewModel ()

@property (nonatomic, strong) WFImageNameModel *imageNameModel;

@end

@implementation WFImageNameViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _imageNameModel = [[WFImageNameModel alloc] init];
        
        /*使用RAC，Model改变则ViewModel改变*/
        [[_imageNameModel rac_valuesAndChangesForKeyPath:@"imageDictionary"  options:NSKeyValueObservingOptionNew observer:self] subscribeNext:^(id x) {
            NSDictionary *dictionary =  [x[1] valueForKey:NSKeyValueChangeNewKey];
            self.imageName = [dictionary objectForKey:@"name"];
        }];
    }
    return self;
}

- (void)getImageNamge {
    /*Model负责获取数据*/
    [_imageNameModel requestImageName];
}

@end

