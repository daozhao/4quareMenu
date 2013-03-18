//
//  AppDelegate.m
//  4quareMenu
//
//  Created by chen daozhao on 13-3-18.
//  Copyright (c) 2013年 chen daozhao. All rights reserved.
//

#import "AppDelegate.h"

#import "view1ViewController.h"
#import "view2ViewController.h"
#import "view3ViewController.h"
#import "view4ViewController.h"
#import "Quare4MenuViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    view1ViewController *vc1 = [[view1ViewController alloc] initWithNibName:@"view1ViewController" bundle:nil];
    view1ViewController *vc2 = [[view1ViewController alloc] initWithNibName:@"view2ViewController" bundle:nil];
    view1ViewController *vc3 = [[view1ViewController alloc] initWithNibName:@"view3ViewController" bundle:nil];
    view1ViewController *vc4 = [[view1ViewController alloc] initWithNibName:@"view4ViewController" bundle:nil];
    
    Quare4MenuViewController *q4mc = [[Quare4MenuViewController alloc]initWithTopLeft:vc1 TopRight:vc2 bottomLeft:vc3 bottomRight:vc4];
    
    
    self.window.rootViewController = q4mc;
//    [self.window addSubview:q4mc.view];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
