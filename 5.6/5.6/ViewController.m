//
//  ViewController.m
//  5.6
//
//  Created by Student1 on 31/1/19.
//  Copyright © 2019 ziheng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgOutput;
- (IBAction)btnHide:(id)sender;
- (IBAction)btnShow:(id)sender;

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


- (IBAction)btnShow:(id)sender {
    [UIView animateWithDuration:3.0 delay:1.0 options:UIViewAnimationOptionCurveLinear animations:^{
        self->_imgOutput.alpha = 1.0;
    } completion:nil];
}
- (IBAction)btnHide:(id)sender {
    [UIView animateWithDuration:3.0 delay:1.0 options:UIViewAnimationOptionCurveLinear animations:^{
        self->_imgOutput.alpha = 0.0;
    } completion:^(BOOL finished){
        [UIView animateWithDuration:3.0 delay:1.0 options:UIViewAnimationOptionCurveLinear animations:^{
            self->_imgOutput.alpha = 1.0;
        } completion:nil];
    }];
}
@end
