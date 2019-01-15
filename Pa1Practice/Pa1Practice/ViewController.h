//
//  ViewController.h
//  Pa1Practice
//
//  Created by Student1 on 2019-01-15.
//  Copyright © 2019 ziheng. All rights reserved.
//



#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>


@interface ViewController : UIViewController<CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
