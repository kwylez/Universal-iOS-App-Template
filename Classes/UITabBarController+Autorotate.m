  //
  //  UITabBarController+Autorotate.m
  //  TabWithSplit
  //
  //  Created by Cory Wiles on 12/6/10.
  //  Copyright 2010 __MyCompanyName__. All rights reserved.
  //

#import "UITabBarController+Autorotate.h"


@implementation UITabBarController (Autorotate)

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  
  UIViewController *controller = self.selectedViewController;
  
  return [controller shouldAutorotateToInterfaceOrientation:interfaceOrientation];
}

@end
