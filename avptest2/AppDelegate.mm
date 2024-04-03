//
//  AppDelegate.m
//  avptest2
//
//  Created by qinsi on 2024/4/3.
//

#import "AppDelegate.h"
#import "NimMetalRenderer.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(nullable NSDictionary<UIApplicationLaunchOptionsKey,id> *)launchOptions {
    NSLog(@"AppDelegate in Objective C");
    NimMain();
    
    return YES;
}

@end
