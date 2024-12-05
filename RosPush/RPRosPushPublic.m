//
//  RPRosPushPublic.m
//  RosPush
//
//  Created by André Kis on 04.12.24.
//

#import "RPRosPushPublic.h"

#ifdef COCOAPODS_POD_AVAILABLE_MainPush
#import <MainPush/MainPush.h>
#import <MainPush/MainPushPublic.h>
#endif
#import <AppMetricaCore/AppMetricaCore.h>

@implementation RPRosPushPublic

#ifdef COCOAPODS_POD_AVAILABLE_MainPush
// Реализация протокола PluginProtocol
- (void)initializePlugin {
    NSLog(@"[SDK B] initializePlugin called");
    AMAAppMetricaConfiguration *configuration = [[AMAAppMetricaConfiguration alloc] initWithAPIKey:[[NSBundle mainBundle] objectForInfoDictionaryKey:@"API_KEY"]];
    [AMAAppMetrica activateWithConfiguration:configuration];
}

- (void)performAction {
    NSLog(@"[SDK B] performAction called");
    // Ваша логика для performAction
}
#endif

+ (void)initializeSDKB {
#ifdef COCOAPODS_POD_AVAILABLE_MainPush
    if ([MainPushPublic.sharedInstance respondsToSelector:@selector(setModulesDelegate:)]) {
        MainPushPublic.sharedInstance.modulesDelegate = [[RPRosPushPublic alloc] init];
        NSLog(@"[SDK B] RPRosPushPublic registered as modulesDelegate");
    } else {
        NSLog(@"[SDK B] MainPushPublic does not support modulesDelegate");
    }
#else
    NSLog(@"[SDK B] MainPush is not available");
#endif
}

@end

