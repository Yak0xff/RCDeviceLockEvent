//
//  DeviceLock_Notification.m
//  RCDeviceLockEvent
//
//  Created by Robin on 5/22/16.
//  Copyright © 2016 Robin. All rights reserved.
//

#import "DeviceLock_Notification.h"
#import <UIKit/UIKit.h>
#import <notify.h>

#import <MobileCoreServices/MobileCoreServices.h>

#define NotificationLock CFSTR("com.apple.springboard.lockcomplete")
#define NotificationChange CFSTR("com.apple.springboard.lockstate")
//#define NotificationPwdUI CFSTR("com.apple.springboard.hasBlankedScreen")


//#define NotificationPlugin CFSTR("com.apple.springboard.deviceWillShutDown")


static void screenLockStateChanged(CFNotificationCenterRef center,void*observer,CFStringRef name,const void* object,CFDictionaryRef userInfo) {
    
    NSString*lockstate = (__bridge NSString*)name;
    
    if ([lockstate isEqualToString:(__bridge  NSString*)NotificationLock]) {
        NSLog(@"DEVICE LOCKED ----- %@", [NSDate date]);
    } else if ([lockstate isEqualToString:(__bridge  NSString*)NotificationChange]){
        NSLog(@"LOCK STATUS CHANGED");
    } 
    
}

@implementation DeviceLock_Notification


+ (void)addListenerForLock {
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),NULL, screenLockStateChanged, NotificationLock, NULL,CFNotificationSuspensionBehaviorDeliverImmediately);
    
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),NULL, screenLockStateChanged, NotificationChange, NULL,CFNotificationSuspensionBehaviorDeliverImmediately);
    
    
//    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),NULL, screenLockStateChanged, NotificationPwdUI, NULL,CFNotificationSuspensionBehaviorDeliverImmediately);
    
    
}


@end
