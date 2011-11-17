//
//  SubDetailViewController.m
//  UniversalExample
//
//  Created by Cory Wiles on 8/2/10.
//  Copyright (c) 2010 __MyCompanyName__. All rights reserved.
//

#import "SubDetailViewController.h"


@implementation SubDetailViewController

@synthesize tblView;
@synthesize tblData;

- (void)dealloc {
  [tblView release];
  [tblData release];
  [super dealloc];
}

- (void)loadView {
  
  UIView *mainView = [[UIView alloc] initWithFrame:CGRectZero];
  
  self.tblView = [[[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain] autorelease];
  
  self.tblView.dataSource = self;
  self.tblView.delegate   = self;
  
  self.view = mainView;
  
  [mainView release];
  
  [self.view addSubview:self.tblView];
  
  self.view.autoresizingMask    = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
  self.view.autoresizesSubviews = YES;
}

- (void)viewDidLoad {
  
  [super viewDidLoad];
  
  self.tblData = [NSArray arrayWithObjects:@"subdetail1 for parent", @"subdetail2 parent", nil];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return YES;
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
  [super viewDidUnload];
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [self.tblData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
  static NSString *CellIdentifier = @"Cell";
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  
  if (cell == nil) {
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
  }
  
  cell.textLabel.text = [self.tblData objectAtIndex:indexPath.row];
  
  return cell;
}

@end
