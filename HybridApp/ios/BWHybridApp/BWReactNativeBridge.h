//
//  BWReactNativeBridge.h
//  BWHybridApp
//
//  Created by BobWong on 2017/7/31.
//  Copyright © 2017年 BobWongStudio. All rights reserved.
//

#import <React/RCTEventEmitter.h>
#import <React/RCTBridgeModule.h>

extern NSString *const BWReactNativeBridgePassParamsEvent;

@interface BWReactNativeBridge : RCTEventEmitter<RCTBridgeModule>

- (void)sendEventToRNWithEventName:(NSString *)eventName params:(NSDictionary *)dict;

@end
