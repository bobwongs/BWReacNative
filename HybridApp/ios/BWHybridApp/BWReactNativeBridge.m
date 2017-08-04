//
//  BWReactNativeBridge.m
//  BWHybridApp
//
//  Created by BobWong on 2017/7/31.
//  Copyright © 2017年 BobWongStudio. All rights reserved.
//

#import "BWReactNativeBridge.h"

NSString *const BWReactNativeBridgePassParamsEvent = @"BWReactNativeBridgePassParamsEvent";

@implementation BWReactNativeBridge

+ (id)allocWithZone:(NSZone *)zone {
    // 一定要这样重写，确保调用RN框架时不会闪退
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
    return @[BWReactNativeBridgePassParamsEvent];
}

- (void)sendEventToRNWithEventName:(NSString *)eventName params:(NSDictionary *)dict {
    [self sendEventWithName:eventName body:dict];
}

@end
