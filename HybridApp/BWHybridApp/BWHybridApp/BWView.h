//
//  BWView.h
//  BWHybridApp
//
//  Created by BobWong on 2017/7/28.
//  Copyright © 2017年 BobWongStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <React/RCTComponent.h>

@interface BWView : UIView

@property (nonatomic, copy) RCTBubblingEventBlock onChange;

@end
