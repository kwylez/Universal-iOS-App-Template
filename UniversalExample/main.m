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
#import "CWAppDelegate_IPhone.h"
#import "CWAppDelegate_IPad.h"

int main(int argc, char *argv[])
{
  @autoreleasepool {
    
    Class appDelegateClass = IS_IPAD() ? [CWAppDelegate_IPad class] : [CWAppDelegate_IPhone class];
    
    return UIApplicationMain(argc, argv, nil, NSStringFromClass(appDelegateClass));
  }
}
