//
//  CWAppDelegate.h
//  UniversalExample
//
//  Created by Cory D. Wiles on 5/13/13.
//  Copyright (c) 2013 Cory D. Wiles. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CWAppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) UISplitViewController *splitViewController;
@property (nonatomic, strong) UITabBarController *tabBarController;
@property (nonatomic, strong) UIImageView *tabBarArrow;
@property (nonatomic, strong) NSMutableArray *tabControllers;

- (void)addTabBarArrow;

@end
