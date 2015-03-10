//
//  HotelLocation.h
//  hoteldata
//
//  Created by Surging Wave Technologies, Inc. on 1/22/15.
//  Copyright (c) 2015 Surging Wave Technologies, Inc.. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface HotelLocation : NSObject <MKAnnotation>


@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, copy) NSString *imageURL;

- (id)initWithName:(NSString*)hotelName image:(NSString*)hotelImage coordinate:(CLLocationCoordinate2D)coordinate;


@end
