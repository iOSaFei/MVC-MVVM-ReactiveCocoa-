//
//  AppDelegate.m
//  MVC
//
//  Created by fly on 2017/5/11.
//  Copyright © 2017年 fly. All rights reserved.
//

#import "AppDelegate.h"
#import "WFTableViewController.h"
#import "SVProgressHUD.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    WFTableViewController *tvc = [[WFTableViewController alloc] init];
    self.window.rootViewController = tvc;
    [self.window makeKeyAndVisible];
    
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleCustom];//设置HUD的Style
    [SVProgressHUD setForegroundColor:[UIColor colorWithRed:61/255.0
                                                      green:137/255.0
                                                       blue:222/255.0
                                                      alpha:1.0]];//设置HUD和文本的颜色
    [SVProgressHUD setBackgroundColor:[UIColor colorWithRed:0.1
                                                      green:0.1
                                                       blue:0.1
                                                      alpha:0.8]];//设置HUD的背景颜色
    
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


@end
