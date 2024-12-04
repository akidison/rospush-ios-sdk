//
//  RPRosPushPublic.h
//  RosPush
//
//  Created by André Kis on 04.12.24.
//

#import <Foundation/Foundation.h>
#import <AppMetricaCore/AppMetricaCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface RPRosPushPublic : NSObject

+ (void)configure:(NSString *)apiKey;

@end

NS_ASSUME_NONNULL_END
