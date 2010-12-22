//
//  UniversalExampleAppDelegate_Phone.h
//  UniversalExample
//
//  Created by Cory Wiles on 7/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UITabBarController+Autorotate.h"

@interface UniversalExampleAppDelegate_Phone : NSObject {
  
  UIWindow *window;
  UITabBarController *tabbarController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabbarController;

@end
