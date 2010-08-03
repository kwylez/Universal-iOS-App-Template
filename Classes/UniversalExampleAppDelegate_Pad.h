//
//  UniversalExampleAppDelegate_Pad.h
//  UniversalExample
//
//  Created by Cory Wiles on 7/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UniversalExampleAppDelegate_Pad : NSObject {
  
  UIWindow *window;
  UISplitViewController *splitViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UISplitViewController *splitViewController;

@end
