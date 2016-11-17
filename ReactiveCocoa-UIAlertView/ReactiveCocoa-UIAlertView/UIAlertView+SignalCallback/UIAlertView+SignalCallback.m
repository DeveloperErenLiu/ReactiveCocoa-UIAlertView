//
//  UIAlertView+SignalCallback.m
//
//  Created by 刘小壮 on 2016/11/15.
//  Copyright © 2016年 刘小壮. All rights reserved.
//

#import "UIAlertView+SignalCallback.h"

@implementation UIAlertView (SignalCallback)

- (RACSignal *)buttonClick {
    
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        [[self rac_signalForSelector:@selector(alertView:clickedButtonAtIndex:)
                        fromProtocol:@protocol(UIAlertViewDelegate)] subscribeNext:^(RACTuple *tuple) {
            [subscriber sendNext:tuple.allObjects[1]];
            [subscriber sendCompleted];
        }];
        
        return [RACDisposable disposableWithBlock:^{
            [self dismissWithClickedButtonIndex:0 animated:YES];
        }];
    }];
}

- (void)setDelegate:(id)delegate {
    if (self.delegate != self) {
        [self setValue:self forKey:@"_delegate"];
    }
}

@end
