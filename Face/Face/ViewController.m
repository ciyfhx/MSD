//
//  ViewController.m
//  Face
//
//  Created by Student1 on 12/2/19.
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


- (IBAction)changeFace:(UIButton*)sender {
    self.draw2D.emotion = sender.tag;
    [self.draw2D setNeedsDisplay];
}
@end
