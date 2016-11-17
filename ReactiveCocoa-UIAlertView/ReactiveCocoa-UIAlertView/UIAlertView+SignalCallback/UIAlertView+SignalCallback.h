//
//  UIAlertView+SignalCallback.h
//
//  Created by 刘小壮 on 2016/11/15.
//  Copyright © 2016年 刘小壮. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface UIAlertView (SignalCallback)

/**
 * button被点击的信号
 * (Category支持取消信号，并且可以在任意位置调用此方法)
 *
 * @return 信号
 */
- (RACSignal *)buttonClick;

@end
