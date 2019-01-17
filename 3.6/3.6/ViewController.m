//
//  ViewController.m
//  3.6
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
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {

    if(event.subtype == UIEventSubtypeMotionShake)
    {
        NSLog(@"Shaking...");
    }
}

-(BOOL)canBecomeFirstResponder {
    return YES;
}

@end