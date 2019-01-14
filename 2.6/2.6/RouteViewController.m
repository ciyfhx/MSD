//
//  RouteViewController.m
//  2.6
//
//  Created by Student1 on 14/1/19.
//  Copyright © 2019 ziheng. All rights reserved.
//

#import "RouteViewController.h"

@interface RouteViewController ()

@end

@implementation RouteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _routeMap.showsUserLocation = YES;
    MKUserLocation *userLocation = _routeMap.userLocation;
    MKCoordinateRegion region =
    MKCoordinateRegionMakeWithDistance(userLocation.location.coordinate,
                                       20000, 20000);
    [_routeMap setRegion:region animated:NO];
    _routeMap.delegate = self;
    [self getDirections];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getDirections
{
    MKDirectionsRequest *request =
    [[MKDirectionsRequest alloc] init];
    
    request.source = [MKMapItem mapItemForCurrentLocation];
    
    request.destination = _destination;
    request.requestsAlternateRoutes = NO;
    MKDirections *directions =
    [[MKDirections alloc] initWithRequest:request];
    
    [directions calculateDirectionsWithCompletionHandler:
     ^(MKDirectionsResponse *response, NSError *error) {
         if (error) {
             // Handle error
         } else {
             [self showRoute:response];
         }
     }];
}

-(void)showRoute:(MKDirectionsResponse *)response
{
    for (MKRoute *route in response.routes)
    {
        [_routeMap
         addOverlay:route.polyline level:MKOverlayLevelAboveRoads];
        
        for (MKRouteStep *step in route.steps)
        {
            NSLog(@"%@", step.instructions);
        }
    }
}

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id < MKOverlay >)overlay
{
    MKPolylineRenderer *renderer =
    [[MKPolylineRenderer alloc] initWithOverlay:overlay];
    renderer.strokeColor = [UIColor blueColor];
    renderer.lineWidth = 5.0;
    return renderer;
}

@end
