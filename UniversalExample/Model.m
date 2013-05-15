//
//  Model.m
//  UniversalExample
//
//  Created by Cory Wiles on 7/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Model.h"


@implementation Model

- (id)init {
  
  self = [super init];
  
  if (self) {
   
    _firstDetail  = @[@{@"name": @"Sublabel 1 For First Detail", @"detail": @"detailvalue11"},
                      @{@"name": @"Sublabel 2 For First Detail", @"detail": @"detailvalue12"}];
    _secondDetail = @[@{@"name": @"Sublabel 1 For Second Detail",@"detail": @"detailvalue21"},
                      @{@"name": @"Sublabel 2 For Second Detail",@"detail": @"detailvalue22"}];
  }
  
  return self;
}

@end
