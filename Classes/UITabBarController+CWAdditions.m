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

@end
