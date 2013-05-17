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

- (void)dealloc {
  
  _tableView.delegate   = nil;
  _tableView.dataSource = nil;
  
  _adBannerView.delegate = nil;
}

- (id)init {
  
  self = [super init];
  
  if (self) {
    self.title = @"Detail";
  }
  
  return self;
}

- (void)loadView {
  
  UIView *mainView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
  
  self.tableView = [[UITableView alloc] initWithFrame:mainView.frame style:UITableViewStylePlain];
  
  self.tableView.delegate         = self;
  self.tableView.dataSource       = self;
  self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  
  self.view = mainView;
  
  [self.view addSubview:self.tableView];
}

- (void)viewDidLoad {
  
  [super viewDidLoad];
  
  [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:DETAIL_CELL_IDENTIFIER];
  
  [self fixupAdView:[[UIApplication sharedApplication] statusBarOrientation]];
}

- (void)viewWillAppear:(BOOL)animated {
  
  [super viewWillAppear:animated];
  
  [self populateTable];
  [self createAdBannerView];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return YES;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
  [self fixupAdView:toInterfaceOrientation];
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

#pragma mark - iAd Custom Methods

- (int)getBannerHeight:(UIInterfaceOrientation)orientation {
  
  if (UIInterfaceOrientationIsLandscape(orientation)) {
    return kLandscapeIAdHeight;
  } else {
    return kPortraitIAdHeight;
  }
}

- (int)getBannerHeight {
  return [self getBannerHeight:[[UIApplication sharedApplication] statusBarOrientation]];
}

- (void)createAdBannerView {
  
  if (!self.adBannerViewIsVisible) {
    
    self.adBannerView = [[ADBannerView alloc] initWithFrame:CGRectZero];
    
    [self configureIAdContentSizes];
    
    [self.adBannerView setFrame:CGRectOffset(self.adBannerView.frame, 0, -([self getBannerHeight] + 20))];
    
    [self.adBannerView setDelegate:self];
    
    [self.view addSubview:self.adBannerView];
  }
}

- (void)fixupAdView:(UIInterfaceOrientation)toInterfaceOrientation {}

- (void)configureIAdContentSizes {
  self.adBannerView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
}

#pragma mark - ADBannerViewDelegate

- (void)bannerViewDidLoadAd:(ADBannerView *)banner {
  
  if (!self.adBannerViewIsVisible) {
    
    self.adBannerViewIsVisible = YES;
    
    [self fixupAdView:[[UIApplication sharedApplication] statusBarOrientation]];
  }
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error {
  
  if (self.adBannerViewIsVisible) {
    
    self.adBannerViewIsVisible = NO;
    
    [self fixupAdView:[[UIApplication sharedApplication] statusBarOrientation]];
  }
}

@end
