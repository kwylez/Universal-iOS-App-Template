//
//  UITabBarController.m
//  UniversalExample
//
//  Created by Cory D. Wiles on 6/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UITabBarController+CWAdditions.h"

@implementation UITabBarController (CWAdditions)

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation duration:(NSTimeInterval)duration {
  [self.delegate tabBarController:self didSelectViewController:self.selectedViewController];
}

- (CGFloat)horizontalLocationFor:(NSUInteger)tabIndex {
  
  /**
   * The first subview in a tabbarcontroller isn't a tabbaritem, but an instance
   * of _UITabBarBackgroundView and the second subview is UIImageView so I'll bump
   * the particular index by 2
   */
  
  tabIndex += 2;
  
  CGFloat tabMiddle = CGRectGetMidX([self.tabBar.subviews[tabIndex] frame]);
  
  return tabMiddle;
}

@end
