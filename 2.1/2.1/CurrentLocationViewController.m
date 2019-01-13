//
//  CurrentLocationViewController.m
//  2.1
//
//  Created by Peh Zi Heng on 13/1/19.
//  Copyright © 2019 Peh Zi Heng. All rights reserved.
//

//IMPORTANT: Remember to set a location if you are using the simulator

#import "CurrentLocationViewController.h"

@interface CurrentLocationViewController ()

@end

@implementation CurrentLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Setup Location Manager
    manager = [[CLLocationManager alloc] init];
    manager.delegate = self;
    [manager requestWhenInUseAuthorization];
    
    [manager startUpdatingLocation];
    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    CLLocation* location = locations[0];
    
    NSLog(@"Latitude = %f, Longitude = %f, Altitude = %f", location.coordinate.latitude, location.coordinate.longitude, location.altitude);
    
}

- (void) locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    //Handle error
    NSLog(@"Error: %@", error);
    
}


@end
