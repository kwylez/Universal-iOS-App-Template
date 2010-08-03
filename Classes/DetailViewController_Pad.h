//
//  DetailViewController_Pad.h
//  UniversalExample
//
//  Created by Cory Wiles on 7/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DetailViewController.h"
#import "SubDetailViewController_iPad.h"

@interface DetailViewController_Pad : DetailViewController <UISplitViewControllerDelegate, UIPopoverControllerDelegate> {
  UIToolbar *toolbar;
  UIPopoverController *popoverController;
}

@property (nonatomic, retain) UIToolbar *toolbar;

@end
