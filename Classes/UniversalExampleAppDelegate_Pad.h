//
//  UniversalExampleAppDelegate_Pad.h
//  UniversalExample
//
//  Created by Cory Wiles on 7/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RootViewController.h"
#import "FirstViewController.h"
#import "RootViewController_Pad.h"
#import "DetailViewController_Pad.h"
#import "UITabBarController+Autorotate.h"

@interface UniversalExampleAppDelegate_Pad : NSObject {

  UITabBarController *tabBarController;
  UISplitViewController *splitViewController;
  
  UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) UITabBarController *tabBarController;
@property (nonatomic, retain) UISplitViewController *splitViewController;

@end
