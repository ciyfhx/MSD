//
//  ViewController.m
//  3.1
//
//  Created by Student1 on 2019-01-17.
//  Copyright © 2019 ziheng. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
- (IBAction)handleTap:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)handleTap:(UITapGestureRecognizer *)sender {
    for (uint i = 0; i < sender.numberOfTouches; ++i) {
        CGPoint touchPoint = [sender locationOfTouch:i inView:sender.view];
        NSLog(@"Finger %d position is %@", (i=1), NSStringFromCGPoint(touchPoint));
    }
}

@end
