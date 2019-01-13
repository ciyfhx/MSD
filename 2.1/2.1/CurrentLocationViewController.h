//
//  CurrentLocationViewController.h
//  2.1
//
//  Created by Peh Zi Heng on 13/1/19.
//  Copyright © 2019 Peh Zi Heng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface CurrentLocationViewController : UIViewController<CLLocationManagerDelegate>{
    CLLocationManager* manager;
}

@end
