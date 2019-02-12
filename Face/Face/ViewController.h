//
//  ViewController.h
//  Face
//
//  Created by Student1 on 12/2/19.
//  Copyright © 2019 ziheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Draw2D.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet Draw2D *draw2D;

- (IBAction)changeFace:(UIButton*)sender;

@end

