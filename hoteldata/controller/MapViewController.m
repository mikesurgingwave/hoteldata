//
//  MapViewController.m
//  hoteldata
//
//  Created by Surging Wave Technologies, Inc. on 1/21/15.
//  Copyright (c) 2015 Surging Wave Technologies, Inc.. All rights reserved.
//


#import "MapViewController.h"
#import "UIImageView+AFNetworking.h"

@interface MapViewController ()

@end


const float METERS_PER_MILE = 1609.34;
// Coordinates for a centralzed map location
const float ZOOM_LOCATION_LAT = 41.886299999999999;
const float ZOOM_LOCATION_LONG = -87.621499999999997;


@implementation MapViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self.mapView setDelegate:self];
    
    [self plotHotelLocations];
    
}


- (void)viewWillAppear:(BOOL)animated {

    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = ZOOM_LOCATION_LAT;
    zoomLocation.longitude= ZOOM_LOCATION_LONG;
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 3 * METERS_PER_MILE, 3 * METERS_PER_MILE);
    [self.mapView setRegion:viewRegion animated:YES];

}


#pragma mark - Map View methods

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(HotelLocation <MKAnnotation>*)annotation {
    
    static NSString *identifier = @"Pin";

    if ([annotation isKindOfClass:[HotelLocation class]]) {
        
        MKPinAnnotationView *annotationView = (MKPinAnnotationView *) [self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];

        if (annotationView == nil) {
            annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        } else {
            annotationView.annotation = annotation;
        }
        
        annotationView.enabled = YES;
        annotationView.canShowCallout = YES;
        
        // Set up the hotel thumbnail image in the annotation

        NSString *hotelImage = annotation.imageURL;
        NSURL *imageURL = [NSURL URLWithString:hotelImage];
        NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
        UIImage *unfiltered_image = [UIImage imageWithData:imageData];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:unfiltered_image];
        annotationView.leftCalloutAccessoryView = imageView;
        
        return annotationView;
    }
    
    return nil;
}


- (void)plotHotelLocations {

    NSMutableArray *hotelAnnotationsArray = [[NSMutableArray alloc] init];
    CLLocationCoordinate2D coordinate;
    HotelLocation *hotelLocation;
    
    // Retrieve all the hotels
    NSArray *hotelList = [[HotelsData sharedInstance] getHotels];
    
    for ( Hotel *aHotel in hotelList )
    {
        coordinate.latitude = aHotel.latitude;
        coordinate.longitude = aHotel.longitude;
        hotelLocation = [[HotelLocation alloc] initWithName:aHotel.name image:aHotel.thumbnail coordinate:coordinate];
        
        [hotelAnnotationsArray addObject:hotelLocation];
        
    }

    [self.mapView addAnnotations:hotelAnnotationsArray];
}


@end