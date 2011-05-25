  //
  //  UniversalExampleAppDelegate.m
  //  UniversalExample
  //
  //  Created by Cory Wiles on 7/29/10.
  //  Copyright __MyCompanyName__ 2010. All rights reserved.
  //

#import "UniversalExampleAppDelegate_Pad.h"

@interface UniversalExampleAppDelegate_Pad (PrivateMethods)
  - (CGFloat)horizontalLocationFor:(NSUInteger)tabIndex;
  - (void)addTabBarArrow;
@end

@implementation UniversalExampleAppDelegate_Pad

@synthesize window;
@synthesize tabBarController;
@synthesize splitViewController;
@synthesize tabBarArrow;

#pragma mark -
#pragma mark Application lifecycle

- (void)dealloc {
  
  [tabBarArrow release];
  [tabBarController release];
  [splitViewController release];
	[window release];
	[super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    

  tabBarController = [[UITabBarController alloc] init];

  tabBarController.delegate = self;

  NSMutableArray *controllers = [[NSMutableArray alloc] init];

  FirstViewController *first = [[FirstViewController alloc] init];
  
  first.title = @"First Tab";
  
  [controllers addObject:first];
  
  [first release];
  
  FirstViewController *second = [[FirstViewController alloc] init];
  
  second.title = @"Second Tab";
  
  [controllers addObject:second];
  
  [second release];
  
  FirstViewController *third = [[FirstViewController alloc] init];
  
  third.title = @"Third Tab";
  
  [controllers addObject:third];
  
  [third release];
  
  /**
   * Add splitview controller
   */
  RootViewController_Pad *rootVC     = [[RootViewController_Pad alloc] initWithNibName:@"RootViewController" bundle:nil];
  
  rootVC.title = @"Root View Controller";
  
  UINavigationController *masterNavController = [[UINavigationController alloc] initWithRootViewController:rootVC];
  
  DetailViewController_Pad *detailVC = [[DetailViewController_Pad alloc] init];

  splitViewController = [[UISplitViewController alloc] init];

  splitViewController.title           = @"SplitVC";
  splitViewController.viewControllers = [NSArray arrayWithObjects:masterNavController, detailVC, nil];
  
  [rootVC release];
  [detailVC release];
  [masterNavController release];
  
  [controllers addObject:splitViewController];

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

#pragma mark - Private Methods

- (void)addTabBarArrow {

  UIImage *tabBarArrowImage = [UIImage imageNamed:@"TabBarNipple.png"];
  
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

  
  [self.window addSubview:tabBarArrow];
}

- (CGFloat)horizontalLocationFor:(NSUInteger)tabIndex {

  CGFloat tabMiddle = CGRectGetMidX([[[[[self tabBarController] tabBar] subviews] objectAtIndex:tabIndex] frame]);
  
  return tabMiddle;
}

- (void)tabBarController:(UITabBarController *)theTabBarController didSelectViewController:(UIViewController *)viewController {

  [UIView animateWithDuration:0.2 animations:^ {
    
    CGFloat xCoord    = [self horizontalLocationFor:tabBarController.selectedIndex];
    CGRect newFrame   = tabBarArrow.frame;
    CGFloat tabBarTop = [[[self tabBarController] tabBar] frame].origin.y;

    newFrame.origin   = CGPointMake(xCoord - (tabBarArrow.frame.size.width/2), tabBarTop - tabBarArrow.frame.size.height);
    tabBarArrow.frame = newFrame;

  }];
}


@end

