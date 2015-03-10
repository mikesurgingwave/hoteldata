//
//  TableViewController.m
//  hoteldata
//
//  Created by Surging Wave Technologies, Inc. on 1/21/15.
//  Copyright (c) 2015 Surging Wave Technologies, Inc.. All rights reserved.
//

#import "TableViewController.h"
#import "UIImageView+AFNetworking.h"

@interface TableViewController ()

@end


typedef NS_ENUM(NSInteger, sortTypes) {
    kSortTotalRate,
    kSortDistance,
    kSortRating
};


@implementation TableViewController {

    NSMutableArray *allHotels;
    
}

#pragma mark - Lifecycle

- (void)viewDidLoad {
    
    [super viewDidLoad];

    // Get all the hotel data
    allHotels = [[HotelsData sharedInstance] getHotels];
    
    NSComparator compareFloats = ^(id string1, id string2)
    {
        NSNumber *number1 = [NSNumber numberWithFloat:[string1 floatValue]];
        NSNumber *number2 = [NSNumber numberWithFloat:[string2 floatValue]];
        
        return [number1 compare:number2];
    };
    
    NSSortDescriptor *totalRateSort = [NSSortDescriptor sortDescriptorWithKey:@"total_rate" ascending:YES comparator:compareFloats];
    
    [allHotels sortUsingDescriptors:@[totalRateSort]];
    
    // Create a segmented control as the custom title view to provide the user with the table sort options
    NSArray *segmentTextContent = @[
                                    NSLocalizedString(@"Total Rate", @""),
                                    NSLocalizedString(@"Distance", @""),
                                    NSLocalizedString(@"Rating", @""),
                                    ];
    
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:segmentTextContent];
    segmentedControl.selectedSegmentIndex = 0;
    segmentedControl.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    segmentedControl.frame = CGRectMake(0, 0, 400.0f, 30.0f);
    [segmentedControl addTarget:self action:@selector(action:) forControlEvents:UIControlEventValueChanged];
    
    self.navigationItem.titleView = segmentedControl;
    
}


#pragma mark - User Actions

- (IBAction)action:(UISegmentedControl*)sender
{
    // A comparator to properly sort the float values
    NSComparator compareFloats = ^(id string1, id string2)
    {
        NSNumber *number1 = [NSNumber numberWithFloat:[string1 floatValue]];
        NSNumber *number2 = [NSNumber numberWithFloat:[string2 floatValue]];
        
        return [number1 compare:number2];
    };
    
    // Determine which segment the user tapped and sort the data accordingly
    switch (sender.selectedSegmentIndex) {

        case kSortTotalRate: /* Sort: Lowest to highest total rate */ {

            NSSortDescriptor *totalRateSort = [NSSortDescriptor sortDescriptorWithKey:@"total_rate" ascending:YES comparator:compareFloats];
            [allHotels sortUsingDescriptors:@[totalRateSort]];
            
            [self.tableView reloadData];

            break;
            
        }
            
        case kSortDistance: /* Sort: Distance from current location from closest to furthest  */ {
            
            NSSortDescriptor *distanceSort = [NSSortDescriptor sortDescriptorWithKey:@"distance" ascending:YES comparator:compareFloats];
            [allHotels sortUsingDescriptors:@[distanceSort]];
            
            [self.tableView reloadData];
            
            break;
        }
            
        case kSortRating: /* Sort: Star rating from highest to lowest, using hotel name as a secondary sort key */ {

            NSSortDescriptor *starRatingSort = [NSSortDescriptor sortDescriptorWithKey:@"star_rating" ascending:NO];
            NSSortDescriptor *hotelNameSort = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];

            NSArray *sortDescriptors = @[starRatingSort, hotelNameSort];
            [allHotels sortUsingDescriptors:sortDescriptors];
            
            [self.tableView reloadData];
            
            break;
        }
        default:
            
            break;
    }
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [[HotelsData sharedInstance] getHotels].count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    Hotel *aHotel = [allHotels objectAtIndex:indexPath.row];
    
    // Populate the table cell with the hotel name
    NSString *hotelName = aHotel.name;
    cell.textLabel.text = hotelName;
    
    NSURL *url = [NSURL URLWithString:aHotel.thumbnail];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    UIImage *placeholderImage = [UIImage imageNamed:@"no_image_available.png"];
    
    __weak UITableViewCell *weakCell = cell;
    
    // Load images asynchronously
    [cell.imageView setImageWithURLRequest:request
                          placeholderImage:placeholderImage
                                   success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                       
                                       weakCell.imageView.image = image;
                                       [weakCell setNeedsLayout];
                                       
                                   } failure:nil];
    
    
    return cell;
}


@end