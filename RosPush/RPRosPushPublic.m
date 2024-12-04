//
//  RPRosPushPublic.m
//  RosPush
//
//  Created by André Kis on 04.12.24.
//

#import "RPRosPushPublic.h"

@implementation RPRosPushPublic

+ (void)configure:(NSString *)apiKey {
    AMAAppMetricaConfiguration *configuration = [[AMAAppMetricaConfiguration alloc] initWithAPIKey:apiKey];
    [AMAAppMetrica activateWithConfiguration:configuration];
}

@end
