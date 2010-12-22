//
//  RootViewController.m
//  UniversalExample
//
//  Created by Cory Wiles on 7/29/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "RootViewController.h"

@implementation RootViewController

/**
 * Credit:  iAd integration methods were modified (slightly) from the AWESOME 
 * tutorial from Ray Wenderlich
 * http://www.raywenderlich.com/1371/how-to-integrate-iad-into-your-iphone-app
 */

@synthesize tblView;
@synthesize adBannerView;
@synthesize adBannerViewIsVisible;

- (void)dealloc {

  [adBannerView setDelegate:nil];
  
  [adBannerView release];
  
  [tblView release];

  tblView = nil;
  
  [super dealloc];
}

- (void)loadView {
  
  UIView *mainView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kIPhoneDefaultWidth, kIPhoneDefaultHeight)];
  
  self.view = mainView;
  
  self.view.autoresizingMask    = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  self.view.autoresizesSubviews = YES;
  
  [mainView release];
  
  self.tblView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
  
  self.tblView.delegate         = self;
  self.tblView.dataSource       = self;  
  self.tblView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  
  [self.view addSubview:self.tblView];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  [self fixupAdView:[UIDevice currentDevice].orientation];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [self createAdBannerView];
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
  return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
  static NSString *CellIdentifier = @"Cell";
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  
  if (cell == nil) {
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
  }
  
  cell.textLabel.text = (indexPath.row) == 0 ? @"First Detail" : @"Second Detail";
  
  return cell;
}

#pragma mark -
#pragma mark Table view delegate

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//  /**
//   * subclass handles this
//   */
//}

#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark iAd Custom Methods

- (int)getBannerHeight:(UIDeviceOrientation)orientation {
  
  if (UIInterfaceOrientationIsLandscape(orientation)) {
    return kLandscapeIAdHeight;
  } else {
    return kPortraitIAdHeight;
  }
}

- (int)getBannerHeight {
  return [self getBannerHeight:[UIDevice currentDevice].orientation];
}

- (void)createAdBannerView {
  
  if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
  
    Class classAdBannerView = NSClassFromString(@"ADBannerView");
    
    if (classAdBannerView != nil) {
      
      self.adBannerView = [[[classAdBannerView alloc] initWithFrame:CGRectZero] autorelease];
      
      [self configureIAdContentSizes];
      
      [adBannerView setFrame:CGRectOffset([adBannerView frame], 0, -[self getBannerHeight])];
      
      [adBannerView setDelegate:self];
      
      [self.view addSubview:adBannerView];        
    }
  }
}

- (void)fixupAdView:(UIInterfaceOrientation)toInterfaceOrientation {
  
  if (adBannerView != nil && (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)) {
    
    [self configureIAdContentSizes];
    
    [UIView beginAnimations:@"fixupViews" context:nil];
    
    if (adBannerViewIsVisible) {
      
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
    
    [adBannerView setRequiredContentSizeIdentifiers:[NSSet setWithObjects:
                                                     ADBannerContentSizeIdentifier320x50, 
                                                     ADBannerContentSizeIdentifier480x32, nil]];
    
    if (UIInterfaceOrientationIsLandscape([UIDevice currentDevice].orientation)) {
      [adBannerView setCurrentContentSizeIdentifier:ADBannerContentSizeIdentifier480x32];
    } else {
      [adBannerView setCurrentContentSizeIdentifier:ADBannerContentSizeIdentifier320x50];            
    }
    
  } else {
    
    [adBannerView setRequiredContentSizeIdentifiers:[NSSet setWithObjects:
                                                     ADBannerContentSizeIdentifierPortrait,
                                                     ADBannerContentSizeIdentifierLandscape, nil]];
    
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
    
    [self fixupAdView:[UIDevice currentDevice].orientation];
  }
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error {
  
  TTDPRINT(@"error loading view: %@", [error localizedDescription]);
  
  if (adBannerViewIsVisible) {        
    
    adBannerViewIsVisible = NO;
    
    [self fixupAdView:[UIDevice currentDevice].orientation];
  }
}


@end

