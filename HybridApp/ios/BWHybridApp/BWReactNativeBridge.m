//
//  BWReactNativeBridge.m
//  BWHybridApp
//
//  Created by BobWong on 2017/7/31.
//  Copyright © 2017年 BobWongStudio. All rights reserved.
//

#import "BWReactNativeBridge.h"

@implementation BWReactNativeBridge

+ (id)allocWithZone:(NSZone *)zone {
    static id sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [super allocWithZone:zone];
    });
    return sharedInstance;
}

RCT_EXPORT_MODULE();

- (NSArray<NSString *> *)supportedEvents
{
    return @[@"sayHello"];
}

- (void)sendEventToRN {
    [self sendEventWithName:@"sayHello" body:@"Hello"];
}

@end
