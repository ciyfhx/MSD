//
//  DetailsViewController.m
//  6.2
//
//  Created by Student1 on 31/1/19.
//  Copyright © 2019 ziheng. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"searchTerm = %@", _searchTerm);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:(BOOL) animated];
    [self searchForTracks];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (void)searchForTracks {
    NSString* bandName = self.searchTerm;
    
    NSString* urlEncodeBandName = [bandName stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSString* iTunesSearchUrlString = [NSString stringWithFormat:@"https://itunes.apple.com/search?media=music&entity=musicTrack&term=%@", urlEncodeBandName];
    
    NSURL* iTunesSearchUrl = [NSURL URLWithString:iTunesSearchUrlString];
    
    NSURLRequest* iTunesSearchUrlRequest = [NSURLRequest requestWithURL:iTunesSearchUrl];
    NSURLSession* sharedUrlSession = [NSURLSession sharedSession];
    
    NSURLSessionDataTask* searchiTunesTask = [sharedUrlSession dataTaskWithRequest:iTunesSearchUrlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
            
            if(error){
                UIAlertController * alert = [UIAlertController
                                             alertControllerWithTitle:@"Error"
                                             message:error.localizedDescription
                                             preferredStyle:UIAlertControllerStyleAlert];
                
                //Add Buttons
                
                UIAlertAction* yesButton = [UIAlertAction
                                            actionWithTitle:@"OK"
                                            style:UIAlertActionStyleDefault
                                            handler:nil];
                
                [alert addAction:yesButton];
                
                [self presentViewController:alert animated:YES completion:nil];
            }else{
                NSString* resultString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                
                NSLog(@"Search results: %@", resultString);
            }
            
        });
    }];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [searchiTunesTask resume];
    
}

@end
