//
//  RPRosPushPublic.m
//  RosPush
//
//  Created by André Kis on 04.12.24.
//

#import "RPRosPushPublic.h"
#import <AppMetricaCore/AppMetricaCore.h>

@implementation RPRosPushPublic

#if __has_include(<MainPush/MainPush.h>)
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
#if __has_include(<MainPush/MainPush.h>)
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

