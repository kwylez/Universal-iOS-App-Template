//
//  CWDetailViewController.m
//  UniversalExample
//
//  Created by Cory D. Wiles on 5/13/13.
//  Copyright (c) 2013 Cory D. Wiles. All rights reserved.
//

#import "CWDetailViewController.h"
#import "Model.h"

static NSString* const DETAIL_CELL_IDENTIFIER = @"DETAIL_CELL_IDENTIFIER";

@interface CWDetailViewController()

@end

@implementation CWDetailViewController

- (id)init {
  
  self = [super init];
  
  if (self) {
    self.title = @"Detail";
  }
  
  return self;
}

- (void)loadView {
  
  self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
  
  self.tableView.dataSource = self;
  self.tableView.delegate   = self;
  
  self.view = self.tableView;
}

- (void)viewDidLoad {

  [super viewDidLoad];
  
  [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:DETAIL_CELL_IDENTIFIER];
}

- (void)viewWillAppear:(BOOL)animated {
  
  [super viewWillAppear:animated];
  
  [self populateTable];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [self.subcategories count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DETAIL_CELL_IDENTIFIER forIndexPath:indexPath];
  
  cell.textLabel.text = self.subcategories[indexPath.row][@"name"];
  
  return cell;
}

#pragma mark - Public Methods

- (void)setSubcategories:(NSArray *)subcategories {
  
  _subcategories = subcategories;
  
  [self populateTable];
}

- (void)populateTable {
  
  if (!self.subcategories) {
    
    Model *subcats = [[Model alloc] init];
    
    _subcategories = subcats.firstDetail;
  }
  
  [self.tableView reloadData];
}


@end
