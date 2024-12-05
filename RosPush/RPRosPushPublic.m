//
//  RPRosPushPublic.m
//  RosPush
//
//  Created by André Kis on 04.12.24.
//

#import "RPRosPushPublic.h"

@implementation RPRosPushPublic

+ (void)load {
    
}

- (void)initializePlugin {
    AMAAppMetricaConfiguration *configuration = [[AMAAppMetricaConfiguration alloc] initWithAPIKey:[[NSBundle mainBundle] objectForInfoDictionaryKey:@"API_KEY"]];
    [AMAAppMetrica activateWithConfiguration:configuration];
}

- (void)performAction { 

}

@end
