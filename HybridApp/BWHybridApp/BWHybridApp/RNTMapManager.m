//
//  RNTMapManager.m
//  BWHybridApp
//
//  Created by BobWong on 2017/7/28.
//  Copyright © 2017年 BobWongStudio. All rights reserved.
//

#import "RNTMapManager.h"

#import <React/RCTViewManager.h>

#import <React/UIView+React.h>

@interface RNTMapManager ()

@property (strong, nonatomic) BWView *myView;

@end

@implementation RNTMapManager

RCT_EXPORT_MODULE()

RCT_EXPORT_VIEW_PROPERTY(onChange, RCTBubblingEventBlock)

- (UIView *)view
{
    BWView *view = [[BWView alloc] init];
    self.myView = view;
    return view;
}

- (void)changeText {
    if (!self.myView.onChange) return;
    
    self.myView.onChange(@{
                           @"nativeText": @"this is the text from native"
                           });
}

@end
