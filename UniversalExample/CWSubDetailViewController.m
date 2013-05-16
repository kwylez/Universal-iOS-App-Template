//
//  SubDetailViewController.m
//  UniversalExample
//
//  Created by Cory Wiles on 8/2/10.
//  Copyright (c) 2010 __MyCompanyName__. All rights reserved.
//

#import "CWSubDetailViewController.h"

static NSString* const SUB_DETAIL_CELL_IDENTIFIER = @"SUB_DETAIL_CELL_IDENTIFIER";

@interface CWSubDetailViewController()

@property (nonatomic, copy) NSArray *tblData;

@end

@implementation CWSubDetailViewController

- (void)dealloc {
  
  _tableView.delegate   = nil;
  _tableView.dataSource = nil;
}

- (id)init {

  self = [super init];
  
  if (self) {
    
    self.title = @"Sub Detail";
    
    _tblData = @[@"subdetail 1 for parent", @"subdetail 2 parent"];
  }
  
  return self;
}

- (void)loadView {
  
  self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds
                                                style:UITableViewStylePlain];
  
  self.tableView.dataSource = self;
  self.tableView.delegate   = self;
  
  self.view = self.tableView;
}

- (void)viewDidLoad {
  
  [super viewDidLoad];
  
  [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:SUB_DETAIL_CELL_IDENTIFIER];
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [self.tblData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SUB_DETAIL_CELL_IDENTIFIER forIndexPath:indexPath];
  
  cell.textLabel.text = [self.tblData objectAtIndex:indexPath.row];
  
  return cell;
}

@end
