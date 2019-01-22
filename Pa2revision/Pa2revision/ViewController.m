//
//  ViewController.m
//  Pa2revision
//
//  Created by Student1 on 2019-01-22.
//  Copyright © 2019 ziheng. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lbltext;

- (IBAction)handleTap:(id)sender;
- (IBAction)handleSwipe:(id)sender;

- (IBAction)clearText:(id)sender;

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


- (IBAction)handleTap:(id)sender {
    _lbltext.text = @"Tap me twice with 2 fingers";
}

- (IBAction)handleSwipe:(UISwipeGestureRecognizer *)sender {
    switch (sender.direction){
        case UISwipeGestureRecognizerDirectionLeft:
            _lbltext.text = @"Left swipe detected";
            break;
        case UISwipeGestureRecognizerDirectionUp:
            _lbltext.text = @"Up swipe detected";
            break;
        default://Do nothing
            break;
    }
}

- (IBAction)clearText:(id)sender {
    _lbltext.text = @"";
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(nullable UIEvent *)event {
    if(event.subtype == UIEventSubtypeMotionShake){
        _lbltext.text = @"Don't shake no more";
    }
}
- (BOOL)canBecomeFirstResponder {
    return YES;
}


@end
