//
//  RPRosPushPublic.h
//  RosPush
//
//  Created by André Kis on 04.12.24.
//

#import <Foundation/Foundation.h>
#ifdef COCOAPODS_POD_AVAILABLE_PushwooshFramework
#import <PushwooshFramework/PushwooshFramework.h>
#else
#endif
#import <AppMetricaCore/AppMetricaCore.h>

NS_ASSUME_NONNULL_BEGIN

extern NSString *const kRosPushApiKey;
@interface RPRosPushPublic : NSObject
#ifdef COCOAPODS_POD_AVAILABLE_PushwooshFramework
<PluginProtocol>
#endif

@end

NS_ASSUME_NONNULL_END
