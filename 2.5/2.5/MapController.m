//
//  MapController.m
//  BasicCoordinate
//
//  Created by Student1 on 8/1/19.
//  Copyright © 2019 ziheng. All rights reserved.
//

#import "MapController.h"

@interface MapController ()

@end

@implementation MapController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //map
    //Polys
    [self putPin:@"NYP" withLatitude:1.3801 withLongtitude:103.8490];
    [self putPin:@"SP" withLatitude:1.3099 withLongtitude:103.7775];
    [self putPin:@"RP" withLatitude:1.4422 withLongtitude:103.7859];
    [self putPin:@"TP" withLatitude:1.3468 withLongtitude:103.9326];
    [self putPin:@"NP" withLatitude:1.3321 withLongtitude:103.7744];
    
    
    [self toCenter:1.3765 withLongtitude:103.8550];
    
    [self.map setShowsUserLocation: YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (void) toCenter:(CGFloat) latitude withLongtitude:(CGFloat) longtitude {
    MKCoordinateRegion region;
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(latitude, longtitude);
    region.center = coordinate;
    region.span.latitudeDelta = .25;
    region.span.longitudeDelta = .25;
    [self.map setRegion:region animated:YES];
}

- (void) putPin:(NSString*)title withLatitude:(CGFloat) latitude withLongtitude:(CGFloat) longtitude {
    MKPointAnnotation* point = [[MKPointAnnotation alloc] init];
    point.coordinate = CLLocationCoordinate2DMake(latitude, longtitude);
    point.title = title;
    [self.map addAnnotation:point];
}



- (IBAction)changeType:(id)sender {
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"Map Type" message:@"type" preferredStyle:UIAlertControllerStyleActionSheet];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Satellite" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        self.map.mapType = MKMapTypeSatellite;
        [self dismissViewControllerAnimated:YES completion:^{
        }];
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Standard" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        self.map.mapType = MKMapTypeStandard;
        [self dismissViewControllerAnimated:YES completion:^{
        }];
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Hybrid" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        self.map.mapType = MKMapTypeHybrid;
        
        [self dismissViewControllerAnimated:YES completion:^{
        }];
    }]];
    
    // Present action sheet.
    [self presentViewController:actionSheet animated:YES completion:nil];
}
@end
