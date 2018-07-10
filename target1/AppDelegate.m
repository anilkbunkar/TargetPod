//
//  AppDelegate.m
//  target1
//
//  Created by Anil Bunkar on 06/06/18.
//  Copyright © 2018 Adobe Systems. All rights reserved.
//

#import "AppDelegate.h"
#import "ADBAdobeTargetMobile.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    [self setupTestConfig];
//    [ADBAdobeTargetMobile SDKV5_SHIM_initShimWithClientCode:@"targetpremiumqa2"
//                                         withMarketingOrgId:@"039E5CD253BE29E30A4C86E6@AdobeOrg"
//                                withAuthoringClusterUrlBase:@"wss://narada-staging-apac.adobemc.com"];
    [ADBAdobeTargetMobile SDKV5_SHIM_initShimWithClientCode:@"japacperf8"
                                         withMarketingOrgId:@"C3E23FE452A536D60A490D45@AdobeOrg"
                                withAuthoringClusterUrlBase:@"wss://narada-apac.adobemc.com"];

    return YES;
}

- (void) setupTestConfig {
#ifdef USE_SDKV5_INTEGRATION
    NSMutableDictionary *config = [NSMutableDictionary dictionary];
    
    // ============================================================
    // global
    // ============================================================
    config[@"global.privacy"] = @"optedin";
    config[@"global.ssl"] = @(NO);
    
    // ============================================================
    // acquisition
    // ============================================================
    config[@"acquisition.appid"] = @"581e3cb847f024e520465c3716a98465fe2fe1f8a21af239375e4f7836a1dfde";
    config[@"acquisition.server"] = @"c00.adobe.com";
    
    // ============================================================
    // analytics
    // ============================================================
    config[@"analytics.aamForwardingEnabled"] = @(NO);
    config[@"analytics.batchLimit"] = @(0);
    config[@"analytics.offlineEnabled"] = @(YES);
    config[@"analytics.rsids"] = @"quahtest.all.the.things";
    config[@"analytics.server"] = @"benedickcorp.sc.omtrdc.net";
    config[@"analytics.referrerTimeout"] = @(0);
    
    // ============================================================
    // audience manager
    // ============================================================
    // Point your audience server to IP address of your SoapUI Mock Service
    // N.B.  localhost will NOT work in a simulator.
    //config[@"audience.server"] = @"10.8.248.216:8080";
    config[@"audience.server"] = @"omniture.demdex.net";
    config[@"audience.timeout"] = @(2);
    
    // ============================================================
    // configuration
    // ============================================================
    config[@"config.appId"] = @"";
    config[@"config.filePath"] = @"";
    config[@"config.update"] = @"";
    config[@"config.internal.boot"] = @"";
    config[@"config.getData"] = @"";
    
    // ============================================================
    // identity
    // ============================================================
    config[@"marketingCloud.org"] = @"5BFD123F5245AECB0A490D45@AdobeOrg";
    // config[@"marketingCloud.org"] = @"972C898555E9F7BC7F000101@AdobeOrg"; // Target App Value
    config[@"identity.adidEnabled"] = @"";
    config[@"identity.adidTimeout"] = @(2);
    
    // ============================================================
    // signals
    // ============================================================
    config[@"signals.url"] = @"";
    
    // ============================================================
    // target
    // ============================================================
    config[@"target.clientCode"] = @"amsdk";
    // config[@"target.clientCode"] = @"targetpremiumqa1";  // Target App Value
    config[@"target.timeout"] = @(2);
    // ============================================================
    // lifecycle
    // ============================================================
    config[@"lifecycle.sessionTimeout"] = @(300);
    config[@"lifecycle.backdateSessionInfo"] = @(false);
    
    [ADBMobileMarketing updateConfiguration:config];
    
    // Set up audience ids while we're here.
    [ADBMobileMarketing audienceSetDpid:@"Foozball" dpuuid:@"Blinkers"];
#else // USE_SDKV5_INTEGRATION
    // Some values to simulate SDK v5 Integration
    [ADBAdobeTargetMobile overrideConfig:
     [NSDictionary dictionaryWithObjectsAndKeys:
      @"2D79D0C885033ED8-60001181E001715B", @"com.adobe.marketing.mobile.Analytics.aid",
      @"cv_testGetVisitorProfile", @"com.adobe.marketing.mobile.Audience.aamProfile.cn_testGetVisitorProfile",
      @"mk3=mv3",@"com.adobe.marketing.mobile.Audience.aamProfile.monk_cookie3",
      @"Foozball",@"com.adobe.marketing.mobile.Audience.dpid",
      @"Blinkers",@"com.adobe.marketing.mobile.Audience.dpuuid",
      @"90244870033253188068252748240607770987",@"com.adobe.marketing.mobile.Audience.uuid",
      @"581e3cb847f024e520465c3716a98465fe2fe1f8a21af239375e4f7836a1dfde",@"com.adobe.marketing.mobile.Configuration.acquisition.appid",
      @"c00.adobe.com",@"com.adobe.marketing.mobile.Configuration.acquisition.server",
      @"0",@"com.adobe.marketing.mobile.Configuration.analytics.aamForwardingEnabled",
      @"0",@"com.adobe.marketing.mobile.Configuration.analytics.batchLimit",
      @"1",@"com.adobe.marketing.mobile.Configuration.analytics.offlineEnabled",
      @"0",@"com.adobe.marketing.mobile.Configuration.analytics.referrerTimeout",
      @"quahtest.all.the.things",@"com.adobe.marketing.mobile.Configuration.analytics.rsids",
      @"benedickcorp.sc.omtrdc.net",@"com.adobe.marketing.mobile.Configuration.analytics.server",
      @"omniture.demdex.net",@"com.adobe.marketing.mobile.Configuration.audience.server",
      @"2",@"com.adobe.marketing.mobile.Configuration.audience.timeout",
      @"optedin",@"com.adobe.marketing.mobile.Configuration.global.privacy",
      @"0",@"com.adobe.marketing.mobile.Configuration.global.ssl",
      @"2",@"com.adobe.marketing.mobile.Configuration.identity.adidTimeout",
      @"0",@"com.adobe.marketing.mobile.Configuration.lifecycle.backdateSessionInfo",
      @"300",@"com.adobe.marketing.mobile.Configuration.lifecycle.sessionTimeout",
      @"amsdk", @"com.adobe.marketing.mobile.Configuration.target.clientCode",
      @"2",@"com.adobe.marketing.mobile.Configuration.target.timeout",
      @"j8Odv6LonN4r3an7LhD3WZrU1bUpAkFkkiY1ncBR96t2PTI",@"com.adobe.marketing.mobile.Identity.blob",
      @"1525917658354",@"com.adobe.marketing.mobile.Identity.lastSync",
      @"9",@"com.adobe.marketing.mobile.Identity.locationHint",
      @"90399583641157801028272743001760169467",@"com.adobe.marketing.mobile.Identity.mid",
      @"TargetMobileTester 1 (1.0)",@"com.adobe.marketing.mobile.Lifecycle.lifecycle.contextData.a.AppID",
      @"(null)",@"com.adobe.marketing.mobile.Lifecycle.lifecycle.contextData.a.CarrierName",
      @"x86_64",@"com.adobe.marketing.mobile.Lifecycle.lifecycle.contextData.a.DeviceName",
      @"iOS 11.3",@"com.adobe.marketing.mobile.Lifecycle.lifecycle.contextData.a.OSVersion",
      @"750x1334",@"com.adobe.marketing.mobile.Lifecycle.lifecycle.contextData.a.Resolution",
      @"Application",@"com.adobe.marketing.mobile.Lifecycle.lifecycle.contextData.a.RunMode",
      @"en-US",@"com.adobe.marketing.mobile.Lifecycle.lifecycle.contextData.a.locale",
      nil]
     ];
#endif // USE_SDKV5_INTEGRATION
    
    // Critical Values for Target Mobile VEC Operation
    
    //    // Checked-in Value
    //    [ADBAdobeTargetMobile overrideConfig:
    //     [NSDictionary dictionaryWithObjectsAndKeys:
    //      @"039E5CD253BE29E30A4C86E6@AdobeOrg", @"com.adobe.marketing.mobile.Configuration.marketingCloud.org",
    //      @"targetpremiumqa2", @"com.adobe.marketing.mobile.Configuration.target.clientCode",
    //      @"wss://narada-staging-apac.adobemc.com", @"com.adobe.target.mobile.naradaUrlBase",
    //      nil]
    //     ];
    
    
    // MUT Values
    [ADBAdobeTargetMobile overrideConfig:
     [NSDictionary dictionaryWithObjectsAndKeys:
      @"039E5CD253BE29E30A4C86E6@AdobeOrg", @"com.adobe.marketing.mobile.Configuration.marketingCloud.org",
      @"targetpremiumqa2", @"com.adobe.marketing.mobile.Configuration.target.clientCode",
      //      @"99CD0AB653FB55A70A4C86E7@AdobeOrg", @"com.adobe.marketing.mobile.Configuration.marketingCloud.org",
      //      @"targetpremiumqa1", @"com.adobe.marketing.mobile.Configuration.target.clientCode",
      @"wss://narada-staging-apac.adobemc.com", @"com.adobe.target.mobile.naradaUrlBase",
      //      @"http://sj1010010254027.corp.adobe.com:8080", @"com.adobe.target.mobile.naradaUrlBase",
      nil]
     ];
    
    //
    //    // BETA Infrastructure
    //    [ADBAdobeTargetMobile overrideConfig:
    //     [NSDictionary dictionaryWithObjectsAndKeys:
    //      @"03DD36275AAFA0FF0A495D29@AdobeOrg", @"com.adobe.marketing.mobile.Configuration.marketingCloud.org",
    //      @"mobiletestus", @"com.adobe.marketing.mobile.Configuration.target.clientCode",
    //      @"ws://narada-preview.adobemc.com", @"com.adobe.target.mobile.naradaUrlBase",
    //      nil]
    //     ];
    
}

#pragma mark - deep link handlers
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    [self handleDeepLink:url];
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url options:(NSDictionary<NSString *, id> *)options {
    [self handleDeepLink:url];
    return YES;
}

#ifdef USE_SDKV5_INTEGRATION
// With SDK v5, we don't need to override these functions, they are caught on the event integration
#else // USE_SDKV5_INTEGRATION
- (void) applicationDidBecomeActive:(UIApplication *_Nonnull)application {
    [ADBAdobeTargetMobile SDKV5_SHIM_applicationDidBecomeActive:application];
}
- (void) applicationWillResignActive:(UIApplication * _Nonnull)application {
    [ADBAdobeTargetMobile SDKV5_SHIM_applicationWillResignActive:application];
}
#endif // USE_SDKV5_INTEGRATION


#pragma mark - deep link helpers
- (void) handleDeepLink:(NSURL *) url {
    /*
     Handle your deep link
     TODO(ilin): This handler should rolled into the SDK v5 eventing structure
     This message should be forwarded to [ADBAdobeTargetMobile handleDeepLink:url] within the custom processor.
     */
#ifdef USE_SDKV5_INTEGRATION
    [ADBMobileMarketing trackAdobeDeepLink:url];
#else // USE_SDKV5_INTEGRATION
    [ADBAdobeTargetMobile SDKV5_SHIM_handleDeepLink:url];
#endif // USE_SDKV5_INTEGRATION
}

@end
