//
//  SubDetailViewController.h
//  UniversalExample
//
//  Created by Cory Wiles on 8/2/10.
//  Copyright (c) 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CWSubDetailViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end
