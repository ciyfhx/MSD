//
//  ViewController.m
//  2.3
//
//  Created by Peh Zi Heng on 13/1/19.
//  Copyright © 2019 Peh Zi Heng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Create point
    MKPointAnnotation* point = [[MKPointAnnotation alloc] init];
    point.coordinate = CLLocationCoordinate2DMake(1.289888, 103.855478);
    point.title = @"Singapore";
    point.subtitle = @"Durian";
    
    //Add point
    [self.mapView addAnnotation:point];
    
    //Center
    self.mapView.centerCoordinate = CLLocationCoordinate2DMake(1.289888, 103.855478);
    
    
}


@end
