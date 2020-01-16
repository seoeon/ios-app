//
//  AppDelegate.m
//  EX1
//
//  Created by Study on 2020/01/15.
//  Copyright © 2020 Study. All rights reserved.
//

#import "AppDelegate.h"
#import "view/MainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    MainViewController *mainViewController = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = mainViewController;
    [self.window makeKeyAndVisible];
    
    return YES;
}





@end
