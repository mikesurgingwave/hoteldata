//
//  HotelsData.h
//  hoteldata
//
//  Created by Surging Wave Technologies, Inc. on 1/21/15.
//  Copyright (c) 2015 Surging Wave Technologies, Inc.. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Hotel.h"


@interface HotelsData : NSObject


// A singleton instance to provide a global access point
+(HotelsData *)sharedInstance;

- (NSMutableArray *)getHotels;

- (NSMutableArray *)getHotelsArray;


@end