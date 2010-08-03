//
//  DetailViewController.h
//  UniversalExample
//
//  Created by Cory Wiles on 7/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"

@interface DetailViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {

  UITableView *tblView;
  NSArray *subcategories;
}

@property (nonatomic, retain) UITableView *tblView;
@property (nonatomic, retain) NSArray *subcategories;

- (void)populateTable;

@end
