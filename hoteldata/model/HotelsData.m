//
//  HotelsData.m
//  hoteldata
//
//  Created by Surging Wave Technologies, Inc. on 1/21/15.
//  Copyright (c) 2015 Surging Wave Technologies, Inc.. All rights reserved.
//

#import "HotelsData.h"


@implementation HotelsData


+(HotelsData *)sharedInstance
{

    static HotelsData *_hotels = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{

        _hotels = [[HotelsData alloc] init];
        
    });
    
    return _hotels;
}


- (NSMutableArray *)getHotels {
    
    NSArray *tempHotelArray = [NSArray array];
    NSMutableArray *hotelListObjects = [NSMutableArray array];
    CLLocationCoordinate2D coordinate;
    
    // Retrieve the json file containing the hotel data
    NSError* error;
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"hotels" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    // Load a temp array with the json hotel data
    tempHotelArray = [[NSMutableArray alloc]initWithArray:[json objectForKey:@"hotels"]];

    for ( NSDictionary *hotelDictionary in tempHotelArray )
    {
        Hotel *aHotel = [[Hotel alloc] init];
        aHotel.distance = [hotelDictionary[@"distance"] floatValue];
        aHotel.direction = hotelDictionary[@"direction"];
        aHotel.star_rating = [hotelDictionary[@"star_rating"] integerValue];
        aHotel.name = hotelDictionary[@"name"];
        aHotel.nightly_rate = [hotelDictionary[@"nightly_rate"] floatValue];
        aHotel.promoted_nightly_rate = [hotelDictionary[@"promoted_nightly_rate"] floatValue];
        aHotel.total_rate = [hotelDictionary[@"nightly_rate"] floatValue];

        NSString *latitude = hotelDictionary[@"latitude"];
        coordinate.latitude = latitude.doubleValue;
        aHotel.latitude = latitude.doubleValue;
        
        NSString *longitude = hotelDictionary[@"longitude"];
        coordinate.longitude = longitude.doubleValue;
        aHotel.longitude = longitude.doubleValue;
        
        aHotel.latitude_longitude = coordinate;
                
        aHotel.key = hotelDictionary[@"key"];
        aHotel.promoted_total_rate = [hotelDictionary[@"promoted_total_rate"] floatValue];
        aHotel.master_id = [hotelDictionary[@"master_id"] integerValue];
        aHotel.thumbnail = hotelDictionary[@"thumbnail"];
        aHotel.street_address = hotelDictionary[@"street_address"];
        aHotel.review_score = [hotelDictionary[@"review_score"] floatValue];
        
        [hotelListObjects addObject:aHotel];
    }
    
    return hotelListObjects;
    
}


- (NSMutableArray *)getHotelsArray {
    
    NSMutableArray *hotelList = [NSMutableArray array];
    
    // Retrieve the json file containing the hotel data
    NSError* error;
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"hotels" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    // Load an array with the json hotel data
    hotelList = [[NSMutableArray alloc]initWithArray:[json objectForKey:@"hotels"]];
    
    return hotelList;
    
}

@end