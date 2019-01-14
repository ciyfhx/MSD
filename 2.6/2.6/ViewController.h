//
//  ViewController.h
//  2.6
//
//  Created by Student1 on 14/1/19.
//  Copyright © 2019 ziheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController<MKMapViewDelegate>

@property (strong, nonatomic) NSMutableArray *matchingItems;
@property (strong, nonatomic) IBOutlet UITextField *searchText;
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
- (IBAction)zoomIn:(id)sender;
- (IBAction)changeMapType:(id)sender;
- (IBAction)textFieldReturn:(id)sender;

@end

