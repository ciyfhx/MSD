//
//  ViewController.m
//  6.2
//
//  Created by Student1 on 31/1/19.
//  Copyright © 2019 ziheng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtQuery;
- (IBAction)btnSearch:(id)sender;

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


- (IBAction)btnSearch:(id)sender {
    [self performSegueWithIdentifier:@"iTunesFindSegue" sender:self];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue.destinationViewController class] isKindOfClass:[DetailsViewController class]]){
        DetailsViewController* iTunesFindVC = segue.destinationViewController;
        iTunesFindVC.searchTerm = self.txtQuery.text;
    }
}

@end
