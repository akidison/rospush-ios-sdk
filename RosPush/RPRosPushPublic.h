//
//  RPRosPushPublic.h
//  RosPush
//
//  Created by André Kis on 04.12.24.
//

#import <Foundation/Foundation.h>

#if __has_include(<MainPush/MainPush.h>)
#import <MainPush/MainPush.h>
#import <MainPush/MainPushPublic.h>
#define MAINPUSH_INCLUDED 1
#else
#define MAINPUSH_INCLUDED 0
#endif

NS_ASSUME_NONNULL_BEGIN

#if __has_include(<MainPush/MainPush.h>)
@interface RPRosPushPublic : NSObject <PluginProtocol>
#else
@interface RPRosPushPublic : NSObject
#endif

+ (instancetype)sharedInstance;

- (void)initializeSDKB;

@end

NS_ASSUME_NONNULL_END
