//
//  CWIPadAppDelegate.m
//  UniversalExample
//
//  Created by Cory D. Wiles on 5/13/13.
//  Copyright (c) 2013 Cory D. Wiles. All rights reserved.
//

#import "CWAppDelegate_IPad.h"
#import "CWMasterViewController_IPad.h"
#import "CWDetailViewController_IPad.h"

@implementation CWAppDelegate_IPad

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  
  [super application:application didFinishLaunchingWithOptions:launchOptions];
  
  CWMasterViewController_IPad *masterViewController  = [[CWMasterViewController_IPad alloc] init];
  UINavigationController *masterNavigationController = [[UINavigationController alloc] initWithRootViewController:masterViewController];
  
  CWDetailViewController_IPad *detailViewController  = [[CWDetailViewController_IPad alloc] init];
  UINavigationController *detailNavigationController = [[UINavigationController alloc] initWithRootViewController:detailViewController];
  
  masterViewController.detailViewController = detailViewController;
  
  self.splitViewController = [[UISplitViewController alloc] init];
  
  self.splitViewController.delegate        = detailViewController;
  self.splitViewController.viewControllers = @[masterNavigationController, detailNavigationController];
  
  self.window.rootViewController = self.splitViewController;
  
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
