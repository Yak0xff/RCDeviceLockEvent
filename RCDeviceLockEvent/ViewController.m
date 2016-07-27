//
//  ViewController.m
//  RCDeviceLockEvent
//
//  Created by Robin on 5/22/16.
//  Copyright © 2016 Robin. All rights reserved.
//

#import "ViewController.h"
#import "DeviceLock_GCD.h"
#import "DeviceLock_Notification.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    NSLog(@"Current lock state: %d", [DeviceLock_GCD lockState]);
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(lockStateChange:) name:RCDeviceLockStateDidChangeNotification object:nil];
    
    [DeviceLock_Notification addListenerForLock];
    
    
    
    
    
    
}

- (void)lockStateChange:(NSNotification *)notification{
    NSLog(@"lock state change: %@", notification.object);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
