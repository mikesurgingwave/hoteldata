//
//  Hotel.h
//  hoteldata
//
//  Created by Surging Wave Technologies, Inc. on 1/21/15.
//  Copyright (c) 2015 Surging Wave Technologies, Inc.. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface Hotel : NSObject

@property (nonatomic, assign) float distance;
@property (nonatomic, strong) NSString *direction;
@property (nonatomic, assign) NSInteger star_rating;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) float nightly_rate;
@property (nonatomic, assign) float promoted_nightly_rate;
@property (nonatomic, assign) float total_rate;
@property (nonatomic, assign) CLLocationDegrees latitude;
@property (nonatomic, assign) CLLocationDegrees longitude;
@property (nonatomic, assign) CLLocationCoordinate2D latitude_longitude;
@property (nonatomic, strong) NSString *key;
@property (nonatomic, assign) float promoted_total_rate;
@property (nonatomic, assign) NSInteger master_id;
@property (nonatomic, strong) NSString *thumbnail;
@property (nonatomic, strong) NSString *street_address;
@property (nonatomic, assign) float review_score;

//Factory Method
+(instancetype)hotelWithData:(float)distance
                   direction:(NSString *)direction
                   star_rating:(NSInteger)star_rating
                   name:(NSString *)name
                   nightly_rate:(float)nightly_rate
                   promoted_nightly_rate:(float)promoted_nightly_rate
                   total_rate:(float)total_rate
                   latitude:(CLLocationDegrees)latitude
                   longitude:(CLLocationDegrees)longitude
                   key:(NSString *)key
                   promoted_total_rate:(float)promoted_total_rate
                   master_id:(NSInteger)master_id
                   thumbnail:(NSString *)thumbnail
                   street_address:(NSString *)street_address
                review_score:(float)review_score;

@end
