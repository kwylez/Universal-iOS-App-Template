//
//  UniversalExampleAppDelegate_Phone.h
//  UniversalExample
//
//  Created by Cory Wiles on 7/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FirstViewController.h"
#import "RootViewController_Phone.h"

/**
 * Slider animation and images from https://github.com/boctor/idev-recipes/tree/master/TabBarAnimation
 */

@interface UniversalExampleAppDelegate_Phone : NSObject <UITabBarControllerDelegate> {
  
  UIWindow *window;
  UITabBarController *tabBarController;
  UIImageView* tabBarArrow;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) UITabBarController *tabBarController;
@property (nonatomic, retain) UIImageView* tabBarArrow;

@end
