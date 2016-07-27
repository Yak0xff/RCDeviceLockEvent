//
//  DeviceLock_GCD.m
//  RCDeviceLockEvent
//
//  Created by Robin on 5/22/16.
//  Copyright © 2016 Robin. All rights reserved.
//

#import "DeviceLock_GCD.h"
#import <notify.h>

RCDeviceLockState lockState = RCDeviceLockStateUnlocked;

NSString *const RCDeviceLockStateDidChangeNotification = @"RCDeviceLockStateDidChangeNotification";

@implementation DeviceLock_GCD

+ (void)load{
    int notifyToken;
    notify_register_dispatch("com.apple.springboard.lockstate", &notifyToken, dispatch_get_main_queue(), ^(int token) {
        uint64_t state = 0;
        notify_get_state(token, &state);
        
        lockState =  (RCDeviceLockState)state;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [[NSNotificationCenter defaultCenter] postNotificationName:RCDeviceLockStateDidChangeNotification object:@(lockState)];
        });
    });
}

+ (RCDeviceLockState)lockState{
    return lockState;
}

@end
