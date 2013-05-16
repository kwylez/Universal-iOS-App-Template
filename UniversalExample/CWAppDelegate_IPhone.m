//
//  CWIPhoneAppDelegate.m
//  UniversalExample
//
//  Created by Cory D. Wiles on 5/13/13.
//  Copyright (c) 2013 Cory D. Wiles. All rights reserved.
//

#import "CWAppDelegate_IPhone.h"
#import "CWMasterViewController_IPhone.h"

@implementation CWAppDelegate_IPhone

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  
  [super application:application didFinishLaunchingWithOptions:launchOptions];
  
  CWMasterViewController_IPhone *masterViewController = [[CWMasterViewController_IPhone alloc] init];

  self.navigationController = [[UINavigationController alloc] initWithRootViewController:masterViewController];

  self.window.rootViewController = self.navigationController;

  [self.window makeKeyAndVisible];
  
  return YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
  [super applicationDidBecomeActive:application];
}

- (void)applicationWillTerminate:(UIApplication *)application {
  [super applicationWillTerminate:application];
}

- (void)applicationWillResignActive:(UIApplication *)application {
  [super applicationWillResignActive:application];
}

@end
