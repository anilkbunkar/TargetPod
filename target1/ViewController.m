//
//  ViewController.m
//  target1
//
//  Created by Anil Bunkar on 06/06/18.
//  Copyright © 2018 Adobe Systems. All rights reserved.
//

#import "ViewController.h"
#import <sys/utsname.h>
#import <AdSupport/ASIdentifierManager.h>
#import "CustomTap.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *welcomeLabel;
@property (weak, nonatomic) IBOutlet UIButton *clickMeButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"Device Model: %@ \nDevice Name:%@",[self getDeviceModel], [self getDeviceName]);
    if ([[ASIdentifierManager sharedManager] isAdvertisingTrackingEnabled]) {
        NSString *adId =  [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString].lowercaseString;
        NSLog(@"ad ID: %@", adId);
    }
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(action1)];
    CustomTap *tap2 = [[CustomTap alloc] initWithTarget:self action:@selector(action2)];
    [self.welcomeLabel addGestureRecognizer:tap2];
    [self.welcomeLabel addGestureRecognizer:tap1];
    [self.welcomeLabel setUserInteractionEnabled:YES];
    
    [self.clickMeButton addTarget:self action:@selector(buttonTapped1) forControlEvents:UIControlEventTouchUpInside];
    [self.clickMeButton addTarget:self action:@selector(buttonTapped2) forControlEvents:UIControlEventTouchUpInside];
}

- (void) buttonTapped1 {
    NSLog(@"Button action 1");
    NSLog(@"Gestures on label %@", self.welcomeLabel.gestureRecognizers);
}

- (void) buttonTapped2 {
    NSLog(@"Button action 2");
}

- (void) action1 {
    NSLog(@"Performing action 1");
}

- (void) action2 {
    NSLog(@"performing action 2");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *) getDeviceModel {
    struct utsname systemInfo;
    uname(&systemInfo);
    
    return [NSString stringWithCString:systemInfo.machine
                              encoding:NSUTF8StringEncoding];
    //    return [[UIDevice currentDevice] model];
}


- (NSString *) getDeviceName {
    if ([UIDevice currentDevice].name) {
        return [UIDevice currentDevice].name;
    }
    
    return [[UIDevice currentDevice] model];
    
}


//+ (NSString *) getDeviceUniqueId{
//    if ([[ASIdentifierManager sharedManager] isAdvertisingTrackingEnabled]) {
//        return [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString].lowercaseString;
//    } else {
//        return [self getDeviceVendorId];
//    }
//}


@end
