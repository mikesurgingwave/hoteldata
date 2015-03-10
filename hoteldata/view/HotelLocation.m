//
//  HotelLocation.m
//  hoteldata
//
//  Created by Surging Wave Technologies, Inc. on 1/22/15.
//  Copyright (c) 2015 Surging Wave Technologies, Inc.. All rights reserved.
//

#import "HotelLocation.h"

@implementation HotelLocation


- (id)initWithName:(NSString*)hotelName image:(NSString*)hotelImage coordinate:(CLLocationCoordinate2D)coordinate {

    if (self = [super init]) {
        
        self.title = hotelName;
        self.subtitle = @" ";
        self.coordinate = coordinate;
        self.imageURL = hotelImage;
    }
    
    return self;
}


@end
