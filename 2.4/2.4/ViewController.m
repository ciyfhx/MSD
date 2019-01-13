//
//  ViewController.m
//  2.4
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
    
    self.mapView.delegate = self;
    
    //Create point
    ImageAnnotation* annotation = [[ImageAnnotation alloc] initWithLocation:CLLocationCoordinate2DMake(1.289684, 103.855487)];
    annotation.image = [self imageWithImage:[UIImage imageNamed:@"sg_flag"] scaledToSize:CGSizeMake(50, 30)];
    
    //Add point
    [self.mapView addAnnotation:annotation];
    
    //Center
    self.mapView.centerCoordinate = CLLocationCoordinate2DMake(1.289684, 103.855487);
    
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    
    static NSString* ref = @"image_annotation";
    
    if([annotation isKindOfClass: [MKUserLocation class]]) return nil;
    
    MKAnnotationView* view = (MKAnnotationView*) [mapView dequeueReusableAnnotationViewWithIdentifier:ref];
    
    if(view == nil) {
        view = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:ref];
    }
    
    view.image = ((ImageAnnotation*) annotation).image;
    
    return view;
    
}

//Resize image
- (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end


@implementation ImageAnnotation

- (id)initWithLocation:(CLLocationCoordinate2D)coord{
    self = [super init];
    if(self){
        _coordinate = coord;
    }
    return self;
}

@end

