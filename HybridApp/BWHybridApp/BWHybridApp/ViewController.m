//
//  ViewController.m
//  BWHybridApp
//
//  Created by BobWong on 2017/7/26.
//  Copyright © 2017年 BobWongStudio. All rights reserved.
//

#import "ViewController.h"

#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>

@interface ViewController ()

@end

@implementation ViewController

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(addEvent:(NSString *)name)
{
    NSLog(@"Pretending to create an event %@", name);
}

RCT_EXPORT_METHOD(dismissReactNativeVC)
{
    [[UIApplication sharedApplication].keyWindow.rootViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)presentNative:(id)sender {
    UIViewController *vc = [[self class] nativeVCWithTitle:@"PresentedNative"];
    UINavigationController *nvgVC = [[UINavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:nvgVC animated:YES completion:nil];
}

- (IBAction)presentReactNative:(id)sender {
    UIViewController *vc = [[self class] nativeVCWithTitle:@"PresentedNative"];
    
    NSURL *jsCodeLocation;
//    jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index.ios" fallbackResource:nil];
    jsCodeLocation = [NSURL URLWithString:@"http://localhost:8081/index.ios.bundle?platform=ios"];
    
    RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                        moduleName:@"AwesomeProject"
                                                 initialProperties:nil
                                                     launchOptions:nil];
    rootView.backgroundColor = [[UIColor alloc] initWithRed:1.0f green:1.0f blue:1.0f alpha:1];
    
    vc.view = rootView;
    [self presentViewController:vc animated:YES completion:nil];
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
