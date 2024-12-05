//
//  RPRosPushPublic.h
//  RosPush
//
//  Created by André Kis on 04.12.24.
//

#import <Foundation/Foundation.h>

#ifdef COCOAPODS_POD_AVAILABLE_MainPush
#import <MainPush/MainPush.h>
#import <MainPush/MainPushPublic.h>
#endif

NS_ASSUME_NONNULL_BEGIN

@interface RPRosPushPublic : NSObject
#ifdef COCOAPODS_POD_AVAILABLE_MainPush
<PluginProtocol>
#endif

+ (void)initializeSDKB;

@end

NS_ASSUME_NONNULL_END
