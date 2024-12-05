//
//  RPRosPushPublic.m
//  RosPush
//
//  Created by André Kis on 04.12.24.
//

#import "RPRosPushPublic.h"
#import <AppMetricaCore/AppMetricaCore.h>

@implementation RPRosPushPublic

+ (instancetype)sharedInstance {
    static RPRosPushPublic *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (BOOL)isAppMetricaAvailable {
    Class appMetricaClass = NSClassFromString(@"AMAAppMetrica");
    return (appMetricaClass != nil);
}

#if __has_include(<MainPush/MainPush.h>)
- (void)initializePlugin {
    if ([self isAppMetricaAvailable]) {
        return;
    }
    AMAAppMetricaConfiguration *configuration = [[AMAAppMetricaConfiguration alloc] initWithAPIKey:[[NSBundle mainBundle] objectForInfoDictionaryKey:@"API_KEY"]];
    [AMAAppMetrica activateWithConfiguration:configuration];
    AMAAppMetrica.locationTrackingEnabled = NO;
}

- (void)performAction {
    NSLog(@"[SDK B] performAction called");
}

- (void)performUserId:(nonnull NSString *)newUserId {
    // перехватываем тот юзер айди который пользователь выставил для P SDK.
    // И тут мы с новым юзер айди можем этот параметр отправить в Апп Метрику
    NSLog(@"NEW USER ID = %@", newUserId);
    [AMAAppMetrica reportEvent:@"USERID_CHANGED" parameters:@{@"NEW_USER_ID": newUserId} onFailure:^(NSError * _Nonnull error) {
        NSLog(@"DID FAIL REPORT EVENT");
        NSLog(@"REPORT ERROR: %@", [error localizedDescription]);
    }];
}

#endif

// инициализируем и говорим делегату что мы будем реализовывать методы протокола
- (void)initializeSDKB {
#if __has_include(<MainPush/MainPush.h>)
    if ([self conformsToProtocol:@protocol(PluginProtocol)]) {
        [[MainPushPublic sharedInstance] setModulesDelegate:self];
    }
#else
    NSLog(@"[SDK B] MainPush is not available");
#endif
}

@end

