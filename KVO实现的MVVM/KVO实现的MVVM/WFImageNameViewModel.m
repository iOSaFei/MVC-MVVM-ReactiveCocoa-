//
//  WFImageNameViewModel.m
//  KVO实现的MVVM
//
//  Created by fly on 2017/5/13.
//  Copyright © 2017年 fly. All rights reserved.
//

#import "WFImageNameViewModel.h"
#import "WFImageNameModel.h"

@interface WFImageNameViewModel ()

@property (nonatomic, strong) WFImageNameModel *imageNameModel;

@end

@implementation WFImageNameViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _imageNameModel = [[WFImageNameModel alloc] init];
        [_imageNameModel addObserver:self forKeyPath:@"imageDictionary" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}

- (void)getImageNamge {
    /*Model负责获取数据*/
    [_imageNameModel requestImageName];
}

/*Model改变则ViewModel改变*/
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    if ([keyPath isEqualToString:@"imageDictionary"]) {
        NSDictionary *dictionary =  [change valueForKey:NSKeyValueChangeNewKey];
        self.imageName = [dictionary objectForKey:@"name"];
    }
    
}

@end
