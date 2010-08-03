//
//  Model.h
//  UniversalExample
//
//  Created by Cory Wiles on 7/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Model : NSObject {
  NSArray *firstDetail;
  NSArray *secondDetail;
}

@property (nonatomic, retain) NSArray *firstDetail;
@property (nonatomic, retain) NSArray *secondDetail;

@end
