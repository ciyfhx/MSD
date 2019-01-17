//
//  ViewController.m
//  3.4
//
//  Created by Student1 on 2019-01-17.
//  Copyright © 2019 ziheng. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
- (IBAction)handlePan:(UIPanGestureRecognizer *)sender;

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


- (IBAction)handlePan:(UIPanGestureRecognizer *)sender {
    for(int i = 0; i < sender.numberOfTouches; i++) {
        CGPoint point = [sender locationOfTouch:i inView:sender.view];
        NSLog(@"Finger no. %d is at location %@", (i + 1), NSStringFromCGPoint(point));
    }
}
@end
