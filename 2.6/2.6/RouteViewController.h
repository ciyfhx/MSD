//
//  RouteViewController.h
//  2.6
//
//  Created by Student1 on 14/1/19.
//  Copyright © 2019 ziheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface RouteViewController : UIViewController
<MKMapViewDelegate>
@property (strong, nonatomic) IBOutlet MKMapView *routeMap;
@property (strong, nonatomic) MKMapItem *destination;
@end        
