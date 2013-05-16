//
//  CWMasterViewController.m
//  UniversalExample
//
//  Created by Cory D. Wiles on 5/13/13.
//  Copyright (c) 2013 Cory D. Wiles. All rights reserved.
//

#import "CWMasterViewController.h"

static NSString* const MASTER_CELL_IDENTIFIER = @"MASTER_CELL_IDENTIFIER";

@interface CWMasterViewController()

@end

@implementation CWMasterViewController

- (id)init {
  
  self = [super init];
  
  if (self) {
    self.title = NSLocalizedString(@"Master", @"Master");
  }
  
  return self;
}
							
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}

- (void)viewDidLoad {
  
  [super viewDidLoad];
  
  [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:MASTER_CELL_IDENTIFIER];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MASTER_CELL_IDENTIFIER forIndexPath:indexPath];
  
  cell.textLabel.text = @"Root";
  cell.textLabel.text = (indexPath.row) == 0 ? @"First Detail" : @"Second Detail";
  
  return cell;
}

@end
