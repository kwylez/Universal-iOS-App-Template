//
//  SubDetailViewController.h
//  UniversalExample
//
//  Created by Cory Wiles on 8/2/10.
//  Copyright (c) 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SubDetailViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
  UITableView *tblView;
  NSArray *tblData;
}

@property (nonatomic, retain) UITableView *tblView;
@property (nonatomic, retain) NSArray *tblData;

@end
