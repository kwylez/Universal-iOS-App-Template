//
//  Constants.h
//  UniversalExample
//
//  Created by Cory Wiles on 11/4/10.
//  Copyright 2010 Wiles, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

#define DEBUG 1

#define kIPhoneDefaultWidth 320
#define kIPadDefaultWidth 768
#define kIPhoneDefaultHeight 480
#define kIPadDefaultHeight 1024
#define kLandscapeIAdHeight 32
#define kPortraitIAdHeight 50

/**
 * Debug macro from Three20 framework.  What would I do without it.
 * http://github.com/three20
 */
#if DEBUG
#define TTDPRINT(xx, ...)  NSLog(@"%s(%d): " xx, __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define TTDPRINT(xx, ...)  ((void)0)
#endif
