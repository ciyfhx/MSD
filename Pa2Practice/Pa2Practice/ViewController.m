//
//  ViewController.m
//  Pa2Practice
//
//  Created by Student1 on 2019-01-21.
//  Copyright © 2019 ziheng. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
- (IBAction)tapDetected:(id)sender;
- (IBAction)longPressDetected:(id)sender;
- (IBAction)swipeDetected:(id)sender;
- (IBAction)rotationDetected:(id)sender;
- (IBAction)pinchDetected:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

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

- (IBAction)longPressDetected:(UIGestureRecognizer *)sender {
    _statusLabel.text = @"Long Press";
}

- (IBAction)swipeDetected:(UIGestureRecognizer *)sender {
    _statusLabel.text = @"Right Swipe";
}

- (IBAction)tapDetected:(UIGestureRecognizer *)sender {
    _statusLabel.text = @"Double Tap";
}

- (IBAction)pinchDetected:(UIGestureRecognizer *)sender {

    CGFloat scale =
            [(UIPinchGestureRecognizer *)sender scale];
    CGFloat velocity =
            [(UIPinchGestureRecognizer *)sender velocity];

    NSString *resultString = [[NSString alloc] initWithFormat:
            @"Pinch - scale = %f, velocity = %f",
            scale, velocity];
    _statusLabel.text = resultString;
}

- (IBAction)rotationDetected:(UIGestureRecognizer *)sender {
    CGFloat radians =
            [(UIRotationGestureRecognizer *)sender rotation];
    CGFloat velocity =
            [(UIRotationGestureRecognizer *)sender velocity];

    NSString *resultString = [[NSString alloc] initWithFormat:
            @"Rotation - Radians = %f, velocity = %f",
            radians, velocity];
    _statusLabel.text = resultString;
}

-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {

    if(event.subtype == UIEventSubtypeMotionShake)
    {
        _statusLabel.text = @"Shake";
    }
}

-(BOOL)canBecomeFirstResponder {
    return YES;
}

@end
