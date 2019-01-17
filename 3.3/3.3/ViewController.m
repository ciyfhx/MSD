//
//  ViewController.m
//  3.3
//
//  Created by Student1 on 2019-01-17.
//  Copyright © 2019 ziheng. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

- (IBAction)handleSwipe:(UISwipeGestureRecognizer *)sender;
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


- (IBAction)handleSwipe:(UISwipeGestureRecognizer *)sender {
    switch(sender.direction) {
        case UISwipeGestureRecognizerDirectionRight:
            NSLog(@"Swipe Right");
            break;
        case UISwipeGestureRecognizerDirectionDown:
            NSLog(@"Swipe Down");
            break;
        case UISwipeGestureRecognizerDirectionLeft:
            NSLog(@"Swipe Left");
            break;
        case UISwipeGestureRecognizerDirectionUp:
            NSLog(@"Swipe Up");
            break;
        default:
            break;
    }
}

@end
