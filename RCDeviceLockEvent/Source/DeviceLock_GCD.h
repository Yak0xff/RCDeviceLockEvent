//
//  DeviceLock_GCD.h
//  RCDeviceLockEvent
//
//  Created by Robin on 5/22/16.
//  Copyright © 2016 Robin. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef enum {
    RCDeviceLockStateUnlocked = 0,
    RCDeviceLockStateLocked = 1
}RCDeviceLockState;


extern NSString *const RCDeviceLockStateDidChangeNotification;


@interface DeviceLock_GCD : NSObject

+ (RCDeviceLockState)lockState;

@end
