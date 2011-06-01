//
//  UniversalExampleAppDelegate_Pad.h
//  UniversalExample
//
//  Created by Cory Wiles on 7/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

/**
 * Slider animation and images from https://github.com/boctor/idev-recipes/tree/master/TabBarAnimation
 */

#import <Foundation/Foundation.h>
#import "UITabBarController+Autorotate.h"
#import "RootViewController.h"
#import "FirstViewController.h"
#import "RootViewController_Pad.h"
#import "DetailViewController_Pad.h"

@interface UniversalExampleAppDelegate_Pad : NSObject <UITabBarControllerDelegate> {

  UITabBarController *tabBarController;
  UISplitViewController *splitViewController;

  UIWindow *window;
  
  UIImageView* tabBarArrow;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) UITabBarController *tabBarController;
@property (nonatomic, retain) UISplitViewController *splitViewController;
@property (nonatomic, retain) UIImageView* tabBarArrow;

@end
