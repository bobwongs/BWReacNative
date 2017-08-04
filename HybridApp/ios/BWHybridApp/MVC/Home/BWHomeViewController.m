//
//  ViewController.m
//  BWHybridApp
//
//  Created by BobWong on 2017/7/26.
//  Copyright © 2017年 BobWongStudio. All rights reserved.
//

#import "BWHomeViewController.h"
#import "BWPresentedRNViewController.h"

@interface BWHomeViewController ()

@end

@implementation BWHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Native and React Native";
}

- (IBAction)presentNative:(id)sender {
    UIViewController *vc = [[self class] nativeVCWithTitle:@"PresentedNative"];
    UINavigationController *nvgVC = [[UINavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:nvgVC animated:YES completion:nil];
}

- (IBAction)presentReactNative:(id)sender {
    BWPresentedRNViewController *rnVC = [BWPresentedRNViewController new];
    [self presentViewController:rnVC animated:YES completion:nil];
}

- (IBAction)pushNative:(id)sender {
    UIViewController *vc = [[self class] nativeVCWithTitle:@"PushedNative"];
    vc.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemUndo target:self action:@selector(popVC)];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)pushReactNative:(id)sender {
    
}

+ (UIViewController *)nativeVCWithTitle:(NSString *)title {
    UIViewController *vc = [UIViewController new];
    vc.title = title;
    vc.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemUndo target:self action:@selector(dismissVC)];  // 这种方式是为了方便Demo演示，不是规范的写法，另注意，静态方法不能出现在实例方法中
    vc.view.backgroundColor = [UIColor whiteColor];
    return vc;
}

+ (void)dismissVC {
    UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    if (vc.navigationController) vc = vc.navigationController;
    [vc dismissViewControllerAnimated:YES completion:nil];
}

+ (void)popVC {
    [[UIApplication sharedApplication].keyWindow.rootViewController.navigationController popViewControllerAnimated:YES];
}

@end
