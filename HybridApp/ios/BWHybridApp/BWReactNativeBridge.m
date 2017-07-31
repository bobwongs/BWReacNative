//
//  BWReactNativeBridge.m
//  BWHybridApp
//
//  Created by BobWong on 2017/7/31.
//  Copyright © 2017年 BobWongStudio. All rights reserved.
//

#import "BWReactNativeBridge.h"

@implementation BWReactNativeBridge

RCT_EXPORT_MODULE();

- (NSArray<NSString *> *)supportedEvents
{
    return @[@"EventReminder"];
}

- (void)sendEventToRN {
    [self sendEventWithName:@"EventReminder" body:@{@"name": @"Event from native"}];
}

@end
