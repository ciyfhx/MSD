//
//  ViewController.h
//  4.2
//
//  Created by Student1 on 2019-01-24.
//  Copyright © 2019 ziheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>


@interface ViewController : UIViewController

@property (nonatomic, strong) NSString *databasePath;
@property (nonatomic) sqlite3 *contactDB;

@property (weak, nonatomic) IBOutlet UITextField *nameInput;
@property (weak, nonatomic) IBOutlet UITextField *classInput;
@property (weak, nonatomic) IBOutlet UITextField *phoneInput;
@property (weak, nonatomic) IBOutlet UILabel *status;


- (IBAction)saveData:(id)sender;
- (IBAction)searchData:(id)sender;
@end
