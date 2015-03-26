//
//  OneEventViewController.m
//  SpotMark
//
//  Created by Rafaela dos Santos Bertolini on 25/03/15.
//  Copyright (c) 2015 Lucas Fraga Schuler. All rights reserved.
//

#import "OneEventViewController.h"
#import "Event.h"
#import <MapKit/MapKit.h>

//
@interface OneEventViewController () <MKMapViewDelegate>

@property (strong, nonatomic) NSMutableArray *matchingItems;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (weak, nonatomic) IBOutlet UILabel *eventName;
@property (weak, nonatomic) IBOutlet UILabel *eventDescription;
@property (weak, nonatomic) IBOutlet UILabel *eventAdress;
@property (weak, nonatomic) IBOutlet UIImageView *eventImage;


@end

@implementation OneEventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor colorWithRed:1 green:0.97 blue:0.84 alpha:0.70]};
    self.title = _evt.name;
    [self textFieldReturn];
    
    _eventName.text = _evt.name;
    _eventDescription.text = _evt.desc;
    _eventAdress.text = _evt.local;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textFieldReturn {

    [_mapView removeAnnotations:[_mapView annotations]];
    [self performSearch];
}


- (void) performSearch {
    
    NSLog(@"%@", _txtAdress);
    //[self zoomIn];
    
    MKLocalSearchRequest *request =
    [[MKLocalSearchRequest alloc] init];
    if(_evt.local == nil)
        request.naturalLanguageQuery = _txtAdress;
    else
        request.naturalLanguageQuery = _evt.local;
    request.region = _mapView.region;
    
    _matchingItems = [[NSMutableArray alloc] init];
    
    MKLocalSearch *search =
    [[MKLocalSearch alloc]initWithRequest:request];
    
    [search startWithCompletionHandler:^(MKLocalSearchResponse
                                         *response, NSError *error) {
        if (response.mapItems.count == 0)
            NSLog(@"No Matches");
        else
            for (MKMapItem *item in response.mapItems)
            {
                [_matchingItems addObject:item];
                MKPointAnnotation *annotation = [[MKPointAnnotation alloc]init];
                annotation.coordinate = item.placemark.coordinate;
                annotation.title = item.name;
                [_mapView addAnnotation:annotation];
            }
    }];
}

- (BOOL) hidesBottomBarWhenPushed{
    return YES;
}

//
//- (void)zoomIn{
//    MKUserLocation *userLocation = _mapView.userLocation;
//    MKCoordinateRegion region =
//    MKCoordinateRegionMakeWithDistance (userLocation.location.coordinate, 2000000, 2000000);
//    [_mapView setRegion:region animated:NO];
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
