//
//  BWBaseViewController.m
//  BWHybridApp
//
//  Created by BobWong on 2017/8/4.
//  Copyright © 2017年 BobWongStudio. All rights reserved.
//

#import "BWBaseViewController.h"

@interface BWBaseViewController ()

@end

@implementation BWBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)dealloc {
    NSLog(@"Dealloc %@", NSStringFromClass([self class]));
}

@end
