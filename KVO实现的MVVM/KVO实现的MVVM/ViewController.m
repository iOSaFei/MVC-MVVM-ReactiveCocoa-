//
//  ViewController.m
//  KVO实现的MVVM
//
//  Created by fly on 2017/5/13.
//  Copyright © 2017年 fly. All rights reserved.
//

/*
 通过KVO实现Model-ViewModel-View的双向绑定
 */
#import "ViewController.h"
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
    [_imageNameViewModel addObserver:self forKeyPath:@"imageName" options:NSKeyValueObservingOptionNew context:nil];
    [_imageNameViewModel getImageNamge];
}

/*View-Model改变则View改变*/
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    if ([keyPath isEqualToString:@"imageName"]) {
        _imageName = [change valueForKey:NSKeyValueChangeNewKey];
        _imageView.image = [UIImage imageNamed:_imageName];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
