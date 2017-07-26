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

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)presentNative:(id)sender {
    [self presentViewController:[[self class] nativeVCWithTitle:@"PresentedNative"] animated:YES completion:nil];
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
    [self.navigationController pushViewController:[[self class] nativeVCWithTitle:@"PushedNative"] animated:YES];
}

- (IBAction)pushReactNative:(id)sender {
    
}

+ (UIViewController *)nativeVCWithTitle:(NSString *)title {
    UIViewController *vc = [UIViewController new];
    vc.title = title;
    vc.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemUndo target:self action:@selector(dismissVC)];
    return vc;
}

- (void)dismissVC {
    [[UIApplication sharedApplication].keyWindow.rootViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
