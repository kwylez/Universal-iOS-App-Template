//
//  DetailViewController.m
//  UniversalExample
//
//  Created by Cory Wiles on 7/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"

@implementation DetailViewController

@synthesize tblView;
@synthesize subcategories;
@synthesize adBannerView;
@synthesize adBannerViewIsVisible;

- (void)dealloc {

  [tblView release];
  tblView = nil;
  
  [subcategories release];
  subcategories = nil;
  
  [adBannerView setDelegate:nil];
  
  [adBannerView release];
  
  [super dealloc];
}

#pragma mark -
#pragma mark View lifecycle

- (void)loadView {
  
  UIView *mainParentView = [[UIView alloc] initWithFrame:CGRectZero];
  
  self.tblView = [[[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain] autorelease];
  
  self.tblView.dataSource = self;
  self.tblView.delegate   = self;
  
  self.view = mainParentView;

  [mainParentView release];
  
  [self.view addSubview:self.tblView];

  self.view.autoresizingMask    = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
  self.view.autoresizesSubviews = YES;
}

- (void)viewDidLoad {

  [self populateTable];
  
  [self fixupAdView:[[UIApplication sharedApplication] statusBarOrientation]];
  
  [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [self createAdBannerView];
}

- (void)viewDidUnload {
  self.subcategories = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return YES;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
  [self fixupAdView:toInterfaceOrientation];
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [self.subcategories count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
  static NSString *CellIdentifier = @"Cell";
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  
  if (cell == nil) {
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
  }
    
  cell.textLabel.text = [[self.subcategories objectAtIndex:indexPath.row] objectForKey:@"name"];

  return cell;
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//  /**
//   * subclass handles this
//   */
//}

#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {

  self.subcategories = nil;
  
  [super didReceiveMemoryWarning];
}

- (void)populateTable {
  
  if (self.subcategories == nil) {

    Model *subcats = [[Model alloc] init];
    
    self.subcategories = subcats.firstDetail;
    
    [subcats release];
    
    [self.tblView reloadData];

  } else {
    [self.tblView reloadData];
  }
}

#pragma mark -
#pragma mark iAd Custom Methods

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
    
  Class classAdBannerView = NSClassFromString(@"ADBannerView");
  
  if (classAdBannerView != nil) {
    
    self.adBannerView = [[[classAdBannerView alloc] initWithFrame:CGRectZero] autorelease];

    [self configureIAdContentSizes];
    
    [adBannerView setFrame:CGRectOffset([adBannerView frame], 0, -[self getBannerHeight])];
    
    [adBannerView setDelegate:self];
    
    [self.view addSubview:adBannerView];        
  }
}

- (void)fixupAdView:(UIInterfaceOrientation)toInterfaceOrientation {
  
  if (adBannerView != nil) {
    
    [self configureIAdContentSizes];
    
    [UIView beginAnimations:@"fixupViews" context:nil];
    
    if (adBannerViewIsVisible) {
      
      TTDPRINT(@"banner should be visible");
      
      CGRect adBannerViewFrame = [adBannerView frame];
      CGRect contentViewFrame  = self.tblView.frame;
      
      adBannerViewFrame.origin.x = 0;
      adBannerViewFrame.origin.y = 0;
      
      [adBannerView setFrame:adBannerViewFrame];
      
      contentViewFrame.origin.y    = [self getBannerHeight:toInterfaceOrientation];
      contentViewFrame.size.height = self.tblView.frame.size.height - [self getBannerHeight:toInterfaceOrientation];
      
      self.tblView.frame = contentViewFrame;
      
    } else {
      
      CGRect adBannerViewFrame = [adBannerView frame];
      
      adBannerViewFrame.origin.x = 0;
      adBannerViewFrame.origin.y = -[self getBannerHeight:toInterfaceOrientation];
      
      [adBannerView setFrame:adBannerViewFrame];
      
      CGRect contentViewFrame = self.tblView.frame;
      
      contentViewFrame.origin.y    = 0;
      contentViewFrame.size.height = self.tblView.frame.size.height;
      
      self.tblView.frame = contentViewFrame;            
    }
    
    [UIView commitAnimations];
  }   
}

- (void)configureIAdContentSizes {
  
  float version = [[[UIDevice currentDevice] systemVersion] floatValue];
  
  if ((version >= 4.000000) && (version <= 4.100000)) {
    
    [adBannerView setRequiredContentSizeIdentifiers:[NSSet setWithObjects:ADBannerContentSizeIdentifier320x50, ADBannerContentSizeIdentifier480x32, nil]];
    
    if (UIInterfaceOrientationIsLandscape([UIDevice currentDevice].orientation)) {
      [adBannerView setCurrentContentSizeIdentifier:ADBannerContentSizeIdentifier480x32];
    } else {
      [adBannerView setCurrentContentSizeIdentifier:ADBannerContentSizeIdentifier320x50];            
    }
    
  } else {
    
    [adBannerView setRequiredContentSizeIdentifiers:[NSSet setWithObjects:ADBannerContentSizeIdentifierPortrait, ADBannerContentSizeIdentifierLandscape, nil]];
    
    if (UIInterfaceOrientationIsLandscape([UIDevice currentDevice].orientation)) {
      [adBannerView setCurrentContentSizeIdentifier:ADBannerContentSizeIdentifierLandscape];
    } else {
      [adBannerView setCurrentContentSizeIdentifier:ADBannerContentSizeIdentifierPortrait];            
    }  
  }
}

#pragma mark -
#pragma mark ADBannerViewDelegate
- (void)bannerViewDidLoadAd:(ADBannerView *)banner {
  
  if (!adBannerViewIsVisible) {                
    
    adBannerViewIsVisible = YES;
    
    [self fixupAdView:[[UIApplication sharedApplication] statusBarOrientation]];
  }
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error {
  
  TTDPRINT(@"error loading view: %@", [error localizedDescription]);
  
  if (adBannerViewIsVisible) {        
    
    adBannerViewIsVisible = NO;
    
    [self fixupAdView:[[UIApplication sharedApplication] statusBarOrientation]];
  }
}

@end

