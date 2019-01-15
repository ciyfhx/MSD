//
//  ViewController.m
//  Pa1Practice
//
//  Created by Student1 on 2019-01-15.
//  Copyright © 2019 ziheng. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "ViewController.h"

@interface ViewController (){
    CLLocationManager * curloc;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //Update locations
    curloc = [CLLocationManager new];
    curloc.delegate = self;
    [curloc requestWhenInUseAuthorization];
    [curloc startUpdatingLocation];

    //Show blue dot
    self.mapView.showsUserLocation = YES;
    //Set current coordinate
    self.mapView.centerCoordinate = CLLocationCoordinate2DMake(1.3788332, 103.8514566);

    //Add AMK MRT
    [self addPin:@"AMK MRT" withLatitude:1.3699718 withLongitude:103.8495000];
    //Add YCK MRT
    [self addPin:@"YCK MRT" withLatitude:1.3806084 withLongitude:103.8480234];

    //Span
    static CGFloat span = .02f;
    self.mapView.region = MKCoordinateRegionMake(CLLocationCoordinate2DMake(1.3788332, 103.8514566), MKCoordinateSpanMake(span, span));

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidDisappear:(BOOL)animated {
    [curloc stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    CLLocation* location = locations[0];
    NSLog(@"Altitude: %f, Longitude: %f, Latitude: %f", location.altitude, location.coordinate.longitude,
            location.coordinate.latitude);
}

- (void) addPin: (NSString*) title withLatitude:(CGFloat) latitude  withLongitude:(CGFloat) longitude{
    MKPointAnnotation * pointAnnotation = [MKPointAnnotation new];
    pointAnnotation.title = title;
    pointAnnotation.coordinate = CLLocationCoordinate2DMake(latitude, longitude);
    [self.mapView addAnnotation:pointAnnotation];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
