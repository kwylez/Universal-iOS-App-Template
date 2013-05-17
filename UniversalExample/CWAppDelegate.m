//
//  CWAppDelegate.m
//  UniversalExample
//
//  Created by Cory D. Wiles on 5/13/13.
//  Copyright (c) 2013 Cory D. Wiles. All rights reserved.
//

#import "CWAppDelegate.h"
#import "CWFirstViewController.h"

/**
 * Slider animation and images from https://github.com/boctor/idev-recipes/tree/master/TabBarAnimation
 */

@interface CWAppDelegate()

@end

@implementation CWAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

  self.tabBarController = [[UITabBarController alloc] init];
  
  self.tabBarController.delegate = self;
  
  self.tabControllers = [NSMutableArray new];
  
  CWFirstViewController *firstViewController = [[CWFirstViewController alloc] init];
  
  [self.tabControllers addObject:firstViewController];

  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  
  return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
//  Sent when the application is about to move from active to inactive state.
//  This can occur for certain types of temporary interruptions (such as an
//  incoming phone call or SMS message) or when the user quits the application
//  and it begins the transition to the background state. Use this method to
//  pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates.
//  Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
//  Use this method to release shared resources, save user data, invalidate
//  timers, and store enough application state information to restore your
//  application to its current state in case it is terminated later. If your
//  application supports background execution, this method is called instead of
//  applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
//  Called as part of the transition from the background to the inactive
//  state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
//  Restart any tasks that were paused (or not yet started) while the application
//  was inactive. If the application was previously in the background, optionally
//  refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
//  Called when the application is about to terminate. Save data if appropriate.
//  See also applicationDidEnterBackground:.
}

#pragma mark - Public Methods

- (void)addTabBarArrow {
  
  UIImage *tabBarArrowImage = [UIImage imageNamed:@"TabBarNipple.png"];
  
  self.tabBarArrow = [[UIImageView alloc] initWithImage:tabBarArrowImage];

  /**
   * To get the vertical location we start at the bottom of the window, go up by
   * height of the tab bar, go up again by the height of arrow and then come
   * back down 2 pixels so the arrow is slightly on top of the tab bar.
   */
  
  CGFloat verticalLocation = (self.window.frame.size.height -
                              self.tabBarController.tabBar.frame.size.height -
                              tabBarArrowImage.size.height) + 2;
  
  self.tabBarArrow.frame = CGRectMake([self.tabBarController horizontalLocationFor:0],
                                 verticalLocation,
                                 tabBarArrowImage.size.width,
                                 tabBarArrowImage.size.height);
  
  [self.tabBarController.view addSubview:self.tabBarArrow];
}

#pragma mark - TabBarController Delegate Methods

- (void)tabBarController:(UITabBarController *)theTabBarController didSelectViewController:(UIViewController *)viewController {
  
  [UIView animateWithDuration:0.2 animations:^ {
    
    CGFloat xCoord    = [self.tabBarController horizontalLocationFor:self.tabBarController.selectedIndex];
    CGRect newFrame   = self.tabBarArrow.frame;
    CGFloat tabBarTop = self.tabBarController.tabBar.frame.origin.y;
    
    newFrame.origin = CGPointMake(xCoord - (self.tabBarArrow.frame.size.width / 2),
                                  (tabBarTop - self.tabBarArrow.frame.size.height + 2));

    self.tabBarArrow.frame = newFrame;
  }];
}

@end
