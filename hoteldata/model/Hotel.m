//
//  Hotel.m
//  hoteldata
//
//  Created by Surging Wave Technologies, Inc. on 1/21/15.
//  Copyright (c) 2015 Surging Wave Technologies, Inc.. All rights reserved.
//

#import "Hotel.h"


@implementation Hotel


#pragma mark - Factory method

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
{
    //Use self in the superclass to ensure you're getting the proper return type for each of the subclasses.
    Hotel *aHotel = [[self alloc] init];
    
    aHotel.distance = distance;
    aHotel.direction = direction;
    aHotel.star_rating = star_rating;
    aHotel.name =  name;
    aHotel.nightly_rate = nightly_rate;
    aHotel.promoted_nightly_rate = promoted_nightly_rate;
    aHotel.total_rate = total_rate;
    aHotel.latitude = latitude;
    aHotel.longitude = longitude;
    aHotel.key = key;
    aHotel.promoted_total_rate = promoted_total_rate;
    aHotel.master_id = master_id;
    aHotel.thumbnail = thumbnail;
    aHotel.street_address = street_address;
    aHotel.review_score = review_score;
    
    //Return the newly created instance.
    return aHotel;
}

-(id) init {
    if((self=[super init])){

    }
    
    return self;
}

@end
