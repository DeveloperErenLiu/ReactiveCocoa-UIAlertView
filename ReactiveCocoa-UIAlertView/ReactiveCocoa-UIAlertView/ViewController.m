//
//  ViewController.m
//  ReactiveCocoa-UIAlertView
//
//  Created by 刘小壮 on 2016/11/17.
//  Copyright © 2016年 刘小壮. All rights reserved.
//

#import "ViewController.h"
#import "UIAlertView+SignalCallback.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@implementation ViewController

- (IBAction)showAlertVIew:(UIButton *)sender {
    
    // 可以在任意位置设置代理，Category内部使用KVC重新设置代理，始终保持代理是UIAlertView。
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Title" message:@"UIAlertView+SignalCallback" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
    [alertView show];
    
    // 调用创建alertView按钮点击信号的方法，订阅按钮点击信号。信号被触发后，传出来的参数是NSNumber类型，表示点击的是哪个按钮的下标。
    // 此方法可以在任意地方调用，不会受代码逻辑影响。
    [[alertView buttonClick] subscribeNext:^(NSNumber *number) {
        NSLog(@"click %ld", number.integerValue);
    }];
    
    /** 
     // 支持RAC的取消订阅信号，取消订阅信号后，可以主动隐藏UIAlertView。
     RACDisposable *dispsable = [[alertView buttonClick] subscribeNext:^(NSNumber *number) {
        NSLog(@"click %ld", number.integerValue);
     }];
     
     dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [dispsable dispose];
     });
     */
}

@end
