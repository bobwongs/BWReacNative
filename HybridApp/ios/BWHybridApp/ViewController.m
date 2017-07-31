//
//  ViewController.m
//  BWHybridApp
//
//  Created by BobWong on 2017/7/26.
//  Copyright © 2017年 BobWongStudio. All rights reserved.
//

#import "ViewController.h"
#import "RNTMapManager.h"
#import "BWReactNativeBridge.h"

#import <React/RCTBridgeModule.h>
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>

@interface ViewController () <RCTBridgeModule>

@end

@implementation ViewController


/* ---------- RN调Native，Export方法供RN进行调用 ---------- */

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(addEvent:(NSString *)name)
{
    NSLog(@"Pretending to create an event %@", name);
}

RCT_EXPORT_METHOD(dismissReactNativeVC)
{
    [[UIApplication sharedApplication].keyWindow.rootViewController dismissViewControllerAnimated:YES completion:nil];
}

/* ---------- RN调Native ---------- */


- (void)viewDidLoad {
    [super viewDidLoad];
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(20, 30, 200, 30);
        [button setTitle:@"Native invoke RN" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(nativeInvokeRN) forControlEvents:UIControlEventTouchUpInside];
        [[UIApplication sharedApplication].keyWindow addSubview:button];
    });
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
    jsCodeLocation = [NSURL URLWithString:@"http://10.2.146.121:8081/index.ios.bundle?platform=ios"];
    
    RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                        moduleName:@"AwesomeProject"
                                                 initialProperties:nil
                                                     launchOptions:nil];
    rootView.backgroundColor = [[UIColor alloc] initWithRed:1.0f green:1.0f blue:1.0f alpha:1];
    
    UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    CGPointMake(CGRectGetWidth([UIScreen mainScreen].bounds) / 2.0, CGRectGetWidth([UIScreen mainScreen].bounds) / 2.0);
    indicatorView.color = [UIColor lightGrayColor];
    [indicatorView startAnimating];
    
    rootView.loadingView = indicatorView;
    
    vc.view = rootView;
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)nativeInvokeRN {
    [[BWReactNativeBridge new] sendEventToRN];
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
