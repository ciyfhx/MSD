//
//  MapController.h
//  BasicCoordinate
//
//  Created by Student1 on 8/1/19.
//  Copyright © 2019 ziheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapController : UIViewController
@property (weak, nonatomic) IBOutlet MKMapView *map;
- (IBAction)changeType:(id)sender;

@end
