//
//  ADBAdobeTargetMobile.h
//  Adobe Target Mobile Visual Experience Composer SDK Extension
//
//  Copyright 2017-2018. Adobe, Inc. All Rights Reserved
//
//  Extension SDK Version: Alpha1

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIApplication.h>

// Predefined constants for configuration
extern NSString * _Nonnull TARGET_AUTHORING_URL_CLUSTER_APAC;
extern NSString * _Nonnull TARGET_AUTHORING_URL_CLUSTER_EU;
extern NSString * _Nonnull TARGET_AUTHORING_URL_CLUSTER_US;

@interface ADBAdobeTargetMobile : NSObject

#pragma mark - Configuration

/**
 *  @brief Gets the version.
 *  @return a string pointer containing the version value.
 */
+ (nonnull NSString*) version;

/**
 API insertion call that specifies the Target View Event.  This call should be inserted into the code
 where the view hierarchy to be targetted is in application memory, AND attached to the view hierarchy,
 but has NOT been drawn to the screen.

 @param targetViewName Developer-specified Target View Name (Please use only UTF-8 alpha numerics for name)
 */
+ (void) setTargetView: (NSString * _Nonnull) targetViewName;
/**
 Allows the override of the configuration values passed to the Mobile VEC extension.  The values take
 precedence over the values provided by other sources (such as Mobile SDK v5).

 @param overrideDictionary a dictionary of strings to strings, that represent key-value pairs of the configuration
 @return whether the Mobile VEC configuration changed was changed with this operation.
 */
+ (BOOL) overrideConfig: (NSDictionary * _Nonnull) overrideDictionary;
/**
 Initializes the Target VEC extension without the SDK v5 framework, relying on the overrideConfig method
 for configuration.
 */
+ (void) SDKV5_SHIM_initShim;
/**
 Initializes the Target VEC extension without the SDK v5 framework.
 
 @param clientCode Target Client Code, get value from Adobe Target Representation (example: mobilevec)
 @param marketingOrgId Marketing Org Identifier, (example: 039E08D253BE29E30A4C86E6@AdobeOrg)
 @param targetAuthoringClusterUrlBase Authoring Base URL for Websocket Routing, use one of the built-in values, TARGET_AUTHORING_URL_CLUSTER_*
 */
+ (void) SDKV5_SHIM_initShimWithClientCode: (NSString * _Nonnull) clientCode
                        withMarketingOrgId: (NSString * _Nonnull) marketingOrgId
               withAuthoringClusterUrlBase: (NSString * _Nonnull) targetAuthoringClusterUrlBase;
/**
 Entry point to deep link integration for Mobile VEC.   The URL must also be added into the manifest, and then added
 to both UIApplicationDelegate::application:handleOpenURL: and UIApplicationDelegate::application:openURL:

 @param url URL of the deeplink to be handled by Mobile VEC
 */
+ (void) SDKV5_SHIM_handleDeepLink: (nullable NSURL *) url;
/**
 Signals to the Mobile VEC extension that the application is going into foreground.   This shim call should be placed
 within the UIApplicationDelegate::applicationDidBecomeActive: method

 @param application application about to go into the foreground
 */
+ (void) SDKV5_SHIM_applicationDidBecomeActive:(UIApplication *_Nonnull)application;
/**
 Signals to the Mobile VEC extension that the application is going into background.   This shim call should be placed
 within the UIApplicationDelegate::applicationWillResignActive: method

 @param application application about to go into the background
 */
+ (void) SDKV5_SHIM_applicationWillResignActive:(UIApplication * _Nonnull)application;
@end



