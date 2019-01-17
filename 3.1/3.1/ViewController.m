//
//  ViewController.m
//  3.1
//
//  Created by Student1 on 2019-01-17.
//  Copyright © 2019 ziheng. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UITapGestureRecognizer * tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    tapGestureRecognizer.numberOfTapsRequired = 1;
    tapGestureRecognizer.numberOfTouchesRequired = 1;

    tapGestureRecognizer.delegate = self;
    [self.view addGestureRecognizer:tapGestureRecognizer];


}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)handleTap:(UITapGestureRecognizer *)sender {
    for (uint i = 0; i < sender.numberOfTouches; ++i) {
        CGPoint touchPoint = [sender locationOfTouch:i inView:sender.view];
        NSLog(@"Finger %d position is %@", (i=1), NSStringFromCGPoint(touchPoint));
    }
}

@end
