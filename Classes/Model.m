//
//  Model.m
//  UniversalExample
//
//  Created by Cory Wiles on 7/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Model.h"


@implementation Model

@synthesize firstDetail;
@synthesize secondDetail;

- (id)init {
  
  if ((self = [super init])) {
    
    self.firstDetail  = [NSArray arrayWithObjects:
                          [NSDictionary dictionaryWithObjectsAndKeys:@"Sublabel 1 For First Detail", @"name", @"detailvalue11", @"detail", nil],
                          [NSDictionary dictionaryWithObjectsAndKeys:@"Sublabel 2 For First Detail", @"name", @"detailvalue12", @"detail", nil], nil
                        ];
    
    self.secondDetail = [NSArray arrayWithObjects:
                          [NSDictionary dictionaryWithObjectsAndKeys:@"Sublabel 1 For Second Detail", @"name", @"detailvalue21", @"detail", nil],
                          [NSDictionary dictionaryWithObjectsAndKeys:@"Sublabel 2 For Second Detail", @"name", @"detailvalue22", @"detail", nil], nil
                        ];
  }
  
  return self;
}

- (void)dealloc {
  
  [firstDetail release];
  [secondDetail release];
  
  [super dealloc];
}

@end
