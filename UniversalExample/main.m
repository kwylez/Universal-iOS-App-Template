//
//  main.m
//  UniversalExample
//
//  Created by Cory D. Wiles on 5/13/13.
//  Copyright (c) 2013 Cory D. Wiles. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CWMacros.h"
#import "CWAppDelegate.h"
#import "CWIPhoneAppDelegate.h"
#import "CWIPadAppDelegate.h"

int main(int argc, char *argv[])
{
  @autoreleasepool {
    
    Class appDelegateClass = IS_IPAD() ? [CWIPadAppDelegate class] : [CWIPhoneAppDelegate class];
    
    return UIApplicationMain(argc, argv, nil, NSStringFromClass(appDelegateClass));
  }
}
