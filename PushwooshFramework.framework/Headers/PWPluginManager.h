//
//  PWPluginManager.h
//  Pushwoosh
//
//  Created by André Kis on 04.12.24.
//  Copyright © 2024 Pushwoosh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <PushwooshFramework/PushwooshFramework.h>

NS_ASSUME_NONNULL_BEGIN

@interface PWPluginManager : NSObject

@property (nonatomic, strong) NSMutableArray<id<PluginProtocol>> *plugins;

- (void)registerPlugin:(id<PluginProtocol>)plugin;

- (void)performActionsForAllPlugins;

@end

NS_ASSUME_NONNULL_END
