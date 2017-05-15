//
//  ViewController.m
//  RAC实现的MVVM
//
//  Created by fly on 2017/5/13.
//  Copyright © 2017年 fly. All rights reserved.
//

#import "ViewController.h"
#import "ReactiveObjC.h"
#import "WFImageNameViewModel.h"

@interface ViewController ()

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) WFImageNameViewModel *imageNameViewModel;

@property (nonatomic, strong) NSString *imageName;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self wf_setUpViews];
    [self wf_bindViewModel];
}

- (void)wf_setUpViews {
    _imageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    _imageView.image = [UIImage imageNamed:_imageName];
    [self.view addSubview:_imageView];
}

- (void)wf_bindViewModel {
    _imageNameViewModel = [[WFImageNameViewModel alloc] init];
    
    /*使用RAC，View-Model改变则View改变*/
    [[_imageNameViewModel rac_valuesAndChangesForKeyPath:@"imageName"  options:NSKeyValueObservingOptionNew observer:self] subscribeNext:^(id x) {
        _imageName = [x[1] valueForKey:NSKeyValueChangeNewKey];
        _imageView.image = [UIImage imageNamed:_imageName];
    }];
    
    [_imageNameViewModel getImageNamge];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
