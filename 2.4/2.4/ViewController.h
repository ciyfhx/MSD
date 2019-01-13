//
//  ViewController.h
//  2.4
//
//  Created by Peh Zi Heng on 13/1/19.
//  Copyright © 2019 Peh Zi Heng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@class ImageAnnotation;

@interface ViewController : UIViewController<MKMapViewDelegate>


@end

@interface ImageAnnotation : NSObject<MKAnnotation>

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic) UIImage* image;

- (id) initWithLocation: (CLLocationCoordinate2D) coord;

@end
