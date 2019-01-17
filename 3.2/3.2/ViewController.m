//
//  ViewController.m
//  3.2
//
//  Created by Student1 on 2019-01-17.
//  Copyright © 2019 ziheng. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
- (IBAction)handlePinch:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)handlePinch:(UIPinchGestureRecognizer*)sender {
    if(sender.state == UIGestureRecognizerStateBegan) {
        // Start of Pinch gesture
    }
    else if (sender.state == UIGestureRecognizerStateChanged) {
        if(sender.scale >= 1) {
            // Zoom in bigger
        }
        else if(sender.scale < 1) {
            // Zoom out smaller
        }
        NSLog(@"Pinch scale = %f", sender.scale); }
    else if (sender.state == UIGestureRecognizerStateEnded) {
        // End of Pinch gesture
    }
}
@end
