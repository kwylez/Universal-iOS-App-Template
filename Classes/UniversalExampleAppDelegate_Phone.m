  //
  //  UniversalExampleAppDelegate.m
  //  UniversalExample
  //
  //  Created by Cory Wiles on 7/29/10.
  //  Copyright __MyCompanyName__ 2010. All rights reserved.
  //

#import "UniversalExampleAppDelegate_Phone.h"
#import "RootViewController.h"


@interface UniversalExampleAppDelegate_Phone ()
  - (CGFloat)horizontalLocationFor:(NSUInteger)tabIndex;
  - (void)addTabBarArrow;
@end

@implementation UniversalExampleAppDelegate_Phone

@synthesize window;
@synthesize tabBarController;
@synthesize tabBarArrow;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  
  tabBarController = [[UITabBarController alloc] init];
  
  tabBarController.delegate = self;
  
  NSMutableArray *controllers = [[NSMutableArray alloc] init];
  
  FirstViewController *first = [[FirstViewController alloc] init];
  
  first.title = @"First Tab";
  
  [controllers addObject:first];
  
  [first release];
  
  RootViewController_Phone *rootVC     = [[RootViewController_Phone alloc] initWithNibName:@"RootViewController" bundle:nil];
  
  rootVC.title = @"Root View Controller";
  
  UINavigationController *masterNavController = [[UINavigationController alloc] initWithRootViewController:rootVC];
  
  [rootVC release];
  
  [controllers addObject:masterNavController];
  
  [masterNavController release];
  
  tabBarController.viewControllers = controllers;
  
  [controllers release];

  [window addSubview:tabBarController.view];
  
  [self addTabBarArrow];
  
  [window makeKeyAndVisible];
  
  return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
  /*
   Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
   Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
   */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
  /*
   Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
   If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
   */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
  /*
   Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
   */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
  /*
   Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
   */
}


- (void)applicationWillTerminate:(UIApplication *)application {
  /*
   Called when the application is about to terminate.
   See also applicationDidEnterBackground:.
   */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
  /*
   Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
   */
}


- (void)dealloc {
	[tabBarController release];
  [tabBarArrow release];
	[window release];
	[super dealloc];
}

#pragma mark - Private Methods
- (void) addTabBarArrow {
  
  UIImage* tabBarArrowImage = [UIImage imageNamed:@"TabBarNipple.png"];
  
  self.tabBarArrow = [[[UIImageView alloc] initWithImage:tabBarArrowImage] autorelease];
  /**
   * To get the vertical location we start at the bottom of the window, go up by 
   * height of the tab bar, go up again by the height of arrow and then come 
   * back down 2 pixels so the arrow is slightly on top of the tab bar.
   */
  CGFloat verticalLocation = self.window.frame.size.height - tabBarController.tabBar.frame.size.height - tabBarArrowImage.size.height + 2;
  tabBarArrow.frame = CGRectMake([self horizontalLocationFor:0], 
                                 verticalLocation, 
                                 tabBarArrowImage.size.width, 
                                 tabBarArrowImage.size.height);
  
  NSLog(@"tabBarArrow frame: %@", NSStringFromCGRect(tabBarArrow.frame));
  
  [self.window addSubview:tabBarArrow];
}

- (CGFloat) horizontalLocationFor:(NSUInteger)tabIndex {
  
  /**
   * A single tab item's width is the entire width of the tab bar divided by number of items
   */
  CGFloat tabItemWidth = self.window.frame.size.width / tabBarController.tabBar.items.count;
  NSLog(@"tabItemWidth for item: %f %i", tabItemWidth, tabIndex);
  /**
   * A half width is tabItemWidth divided by 2 minus half the width of the arrow
   */
  CGFloat halfTabItemWidth = (tabItemWidth / 2.0) - (tabBarArrow.frame.size.width / 2.0);
  NSLog(@"halfTabItemWidth: %f", halfTabItemWidth);
  
  /**
   * The horizontal location is the index times the width plus a half width
   */
  return (tabIndex * tabItemWidth) + halfTabItemWidth;
}

- (void)tabBarController:(UITabBarController *)theTabBarController didSelectViewController:(UIViewController *)viewController {
  
  NSLog(@"%s", __PRETTY_FUNCTION__);
  
  [UIView animateWithDuration:0.2 animations:^ {
    
    CGRect frame = tabBarArrow.frame;
    
    frame.origin.x = [self horizontalLocationFor:tabBarController.selectedIndex];
    
    tabBarArrow.frame = frame;    
  }];
}


@end

