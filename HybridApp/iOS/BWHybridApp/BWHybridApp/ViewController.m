//
//  ViewController.m
//  BWHybridApp
//
//  Created by BobWong on 2017/7/26.
//  Copyright © 2017年 BobWongStudio. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)presentNative:(id)sender {
    [self presentViewController:[[self class] nativeVCWithTitle:@"PresentedNative"] animated:YES completion:nil];
}

- (IBAction)presentReactNative:(id)sender {
    
}

- (IBAction)pushNative:(id)sender {
    [self.navigationController pushViewController:[[self class] nativeVCWithTitle:@"PushedNative"] animated:YES];
}

- (IBAction)pushReactNative:(id)sender {
    
}

+ (UIViewController *)nativeVCWithTitle:(NSString *)title {
    UIViewController *vc = [UIViewController new];
    vc.title = title;
    return vc;
}

@end
