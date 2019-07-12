//
//  BInternetConnectivity.m
//  AFNetworking
//
//  Created by Ben on 10/10/18.
//

#import "BInternetConnectivityHandler.h"
#import <ChatSDK/Core.h>
#import "TMReachability.h"

@implementation BInternetConnectivityHandler

-(instancetype) init {
    if ((self = [super init])) {
        [[TMReachability reachabilityForInternetConnection] startNotifier];
        [[NSNotificationCenter defaultCenter] addObserverForName:kTMReachabilityChangedNotification object:Nil queue:Nil usingBlock:^(NSNotification * notification) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [BChatSDK.hook executeHookWithName:bHookInternetConnectivityChanged data:Nil];
            });
        }];
    }
    return self;
}

-(BOOL) isConnected {
    return [TMReachability reachabilityForInternetConnection].isReachable;
}

@end
