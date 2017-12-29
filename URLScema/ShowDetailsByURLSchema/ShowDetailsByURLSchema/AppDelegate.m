//
//  AppDelegate.m
//  ShowDetailsByURLSchema
//
//  Created by Pawan kumar on 12/10/17.
//  Copyright © 2017 Pawan Kumar. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    if (url != nil && [url isFileURL]) {
        // Handle file being passed in
        
    }else
    {
        // Handle custom URL scheme
        [self handleCustomOpenURL:url];
    }
    return YES;
}

//Please note: This method is deprecated. It's added here for backward compatibility
-(BOOL) application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    
    if (url != nil && [url isFileURL]) {
        // Handle file being passed in
       
    }else
    {
        // Handle custom URL scheme
        [self handleCustomOpenURL:url];
    }
    return YES;
}

- (void)handleCustomOpenURL:(NSURL *)url {
    
    NSLog(@"url:-> %@",url);
    NSString *file = [NSString stringWithFormat:@"%@",url];
    file  = [file stringByReplacingOccurrencesOfString:@"showdetails://" withString:@""];
    file  = [file stringByReplacingOccurrencesOfString:@"%20" withString:@" "];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"handleOpenURL"
                                                        object:nil
                                                      userInfo:@{@"File" : file}];
}


@end
