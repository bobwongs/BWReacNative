//
//  BWPresentedRNViewController.m
//  BWHybridApp
//
//  Created by BobWong on 2017/8/4.
//  Copyright © 2017年 BobWongStudio. All rights reserved.
//

#import "BWPresentedRNViewController.h"
#import "BWReactNativeBridge.h"
#import <SVProgressHUD.h>

#import <React/RCTBridgeModule.h>
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>

@interface BWPresentedRNViewController () <RCTBridgeModule>

@property (strong, nonatomic) BWReactNativeBridge *rnBridge;
@property (strong, nonatomic) UIButton *nativeRevokeRNBtn;

@end

@implementation BWPresentedRNViewController

/* ---------- RN调Native，Export方法供RN进行调用 ---------- */

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(addEvent:(NSString *)name)
{
    NSLog(@"Pretending to create an event %@", name);
}

RCT_EXPORT_METHOD(dismissReactNativeVC)
{
    [self.nativeRevokeRNBtn removeFromSuperview];
    
    [[UIApplication sharedApplication].keyWindow.rootViewController.presentedViewController dismissViewControllerAnimated:YES completion:nil];
}

/* ---------- RN调Native ---------- */

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"PresentedNative";
    
    [self setUI];
    [self setButton];
}

- (void)setUI
{
    NSURL *jsCodeLocation;
    jsCodeLocation = [NSURL URLWithString:@"http://10.2.146.121:8081/index.ios.bundle?platform=ios"];  // Remote
//        jsCodeLocation = [NSURL fileURLWithPath:[NSBundle.mainBundle pathForResource:@"index.ios" ofType:@"bundle"]];  // 这种从本地去调用的方式，则会在服务器端没有调试界面出来
    
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
    
    self.view = rootView;
}

- (void)setButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    self.nativeRevokeRNBtn = button;
    button.frame = CGRectMake(20, 30, 150, 30);
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [button setTitle:@"Native invoke RN" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(nativeInvokeRN) forControlEvents:UIControlEventTouchUpInside];
    [[UIApplication sharedApplication].keyWindow addSubview:button];
}

- (void)nativeInvokeRN {
    NSDictionary *params = @{@"text": @"Text Frome Native"};
    [self.rnBridge sendEventToRNWithEventName:BWReactNativeBridgePassParamsEvent params:params];
}

- (BWReactNativeBridge *)rnBridge {
    if (!_rnBridge) {
        _rnBridge = [[BWReactNativeBridge alloc] init];
    }
    return _rnBridge;
}

@end
