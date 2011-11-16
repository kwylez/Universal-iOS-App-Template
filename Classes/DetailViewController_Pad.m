//
//  DetailViewController_Pad.m
//  UniversalExample
//
//  Created by Cory Wiles on 7/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController_Pad.h"


@interface DetailViewController_Pad()
  @property (nonatomic, retain) UIPopoverController *popoverController;
@end

@implementation DetailViewController_Pad

@synthesize toolbar;
@synthesize popoverController;

- (void)dealloc {
  [toolbar release];
  [popoverController release];
  [super dealloc];
}

- (void) viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
}

- (void)viewDidLoad {
  
  /**
   *  Hard code values for frames are NOT recommended, but here for breavity sake
   */
  
  [super viewDidLoad];

  self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
  self.toolbar                     = [[[UIToolbar alloc] initWithFrame:CGRectZero] autorelease];
  
  CGRect tbFrame;
  CGRect tblFrame;

  tbFrame  = CGRectMake(0, 0, 1024, 44);
  
  self.toolbar.frame = tbFrame;
  
  [self.view addSubview:self.toolbar];

  tblFrame = CGRectMake(0, 44, 830, 1024);
  
  self.tblView.frame = tblFrame;
  
  [self.view addSubview:self.toolbar];
  [self.view bringSubviewToFront:self.toolbar];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  
  [tableView deselectRowAtIndexPath:indexPath animated:YES];
  
  SubDetailViewController_iPad *subDetail = [[SubDetailViewController_iPad alloc] init];
  UINavigationController *nav             = [[UINavigationController alloc] initWithRootViewController:subDetail];

  nav.modalPresentationStyle = UIModalPresentationPageSheet;
  
  [self presentModalViewController:nav animated:YES];
  
  [subDetail release];
  [nav release];
}

- (void)viewDidUnload {
  self.toolbar = nil;
  self.tblView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return YES;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
  [self fixupAdView:toInterfaceOrientation];
}

- (void)populateTable {
  
  if (popoverController != nil) {
    [popoverController dismissPopoverAnimated:YES];
  }  
  
  [super populateTable];
}

#pragma mark -
#pragma mark SplitView
- (void)splitViewController:(UISplitViewController*)svc 
     willHideViewController:(UIViewController *)aViewController
          withBarButtonItem:(UIBarButtonItem*)barButtonItem 
       forPopoverController: (UIPopoverController*)pc {
  
  barButtonItem.title = @"Main Bar Button Item";
  
  [self.toolbar setItems:[NSArray arrayWithObject:barButtonItem] animated:YES];
  
  self.popoverController = pc;
}

- (void)splitViewController: (UISplitViewController*)svc 
     willShowViewController:(UIViewController *)aViewController
  invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem { 
  
  [self.toolbar setItems:[NSArray array] animated:YES];
  
  self.popoverController = nil;
}

- (void)fixupAdView:(UIInterfaceOrientation)toInterfaceOrientation {
  
  if (adBannerView != nil) {
    
    [super configureIAdContentSizes];
    
    [UIView beginAnimations:@"fixupViews" context:nil];
    
    CGFloat toolbarHeight = self.toolbar.frame.size.height;
    
    if (adBannerViewIsVisible) {
      
      CGRect adBannerViewFrame = [adBannerView frame];
      CGRect contentViewFrame  = self.tblView.frame;
      
      adBannerViewFrame.origin.x = 0;
      adBannerViewFrame.origin.y = 0 + toolbarHeight;
      
      [adBannerView setFrame:adBannerViewFrame];
      
      contentViewFrame.origin.y    = adBannerViewFrame.origin.y + 5 + [self getBannerHeight];
      contentViewFrame.size.height = self.tblView.frame.size.height - [self getBannerHeight];
      
      self.tblView.frame = contentViewFrame;
      
    } else {
      
      CGRect adBannerViewFrame = [adBannerView frame];
      
      adBannerViewFrame.origin.x = 0;
      adBannerViewFrame.origin.y = -([self getBannerHeight:toInterfaceOrientation] + toolbarHeight);
      
      [adBannerView setFrame:adBannerViewFrame];
      
      CGRect contentViewFrame = self.tblView.frame;
      
      contentViewFrame.origin.y    = 0 + toolbarHeight;
      contentViewFrame.size.height = self.tblView.frame.size.height;
      
      self.tblView.frame = contentViewFrame;            
    }
    
    [UIView commitAnimations];
  }   
}

- (int)getBannerHeight:(UIInterfaceOrientation)orientation {

  /**
   * For some reason when the device rotates to landscape the landscape version 
   * of the iAd isn't respected, probably due to the use of a splitViewController, 
   * and the table view 'y' coordinates isn't consistant.
   *
   * So in order to 'fix' this issue I always return 32
   */
  return kPortraitIAdHeight;
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
    
    /**
     * Once again I am forcing the iAd portrait version because of the 
     * splitviewcontroller and view sizes of the 'detail' controller.  I don't know
     * yet if this is a developer problem or a bug with Apple
     */
    [adBannerView setRequiredContentSizeIdentifiers:[NSSet setWithObjects:ADBannerContentSizeIdentifierPortrait,nil]];
    
    [adBannerView setCurrentContentSizeIdentifier:ADBannerContentSizeIdentifierPortrait];
  }
}

@end
