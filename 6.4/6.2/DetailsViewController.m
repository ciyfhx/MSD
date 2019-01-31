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
    self.firstLettersArray = [NSMutableArray array];
    self.tracksDictionary = [NSMutableDictionary dictionary];
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
    return self.firstLettersArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString* firstLetter = [self.firstLettersArray objectAtIndex:section];
    NSArray* tracksWithFirstLetter = [self.tracksDictionary objectForKey:firstLetter];
    
    return tracksWithFirstLetter.count;
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
                
                NSError* jsonParseError = nil;
                NSDictionary* jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParseError];
                
                if(jsonParseError){
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
                    for (NSString* key in jsonDictionary.keyEnumerator) {
                        NSLog(@"First level key: %@", key);
                    }
                    
                    
                    [self.firstLettersArray removeAllObjects];
                    [self.tracksDictionary removeAllObjects];
                    
                    NSArray* searchResultsArray = [jsonDictionary objectForKey:@"results"];
                    
                    for (NSDictionary* trackInfoDictionary in searchResultsArray) {
                        iTunesTrack* track = [[iTunesTrack alloc] init];
                        track.trackName = [trackInfoDictionary objectForKey:@"trackName"];
                        track.collectionName = [trackInfoDictionary objectForKey:@"collectionName"];
                        track.previewUrlString = [trackInfoDictionary objectForKey:@"previewUrl"];
                        track.iTunesUrlString = [trackInfoDictionary objectForKey:@"trackViewUrl"];
                        
                        NSString* trackFirstLetter = [track.trackName substringFromIndex:1];
                        NSMutableArray* tracksWithFirstLetter = [self.tracksDictionary objectForKey:trackFirstLetter];
                        
                        if(!tracksWithFirstLetter){
                            tracksWithFirstLetter = [NSMutableArray array];
                            [self.firstLettersArray addObject:tracksWithFirstLetter];
                        }
                        
                        [tracksWithFirstLetter addObject:track];
                        [tracksWithFirstLetter sortUsingSelector:@selector(compare:)];
                        
                        [self.tracksDictionary setObject:track forKey:trackFirstLetter];
                    }
                    [self.firstLettersArray sortUsingSelector:@selector(compare:)];
                    [self.tableView reloadData];
                    
                }
                
            }
            
        });
    }];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [searchiTunesTask resume];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* CellIdentifier = @"trackCell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSString* firstLetter = [self.firstLettersArray objectAtIndex:indexPath.section];
    
    NSArray* tracksWithFirstLetter = [self.tracksDictionary objectForKey:firstLetter];
    
    iTunesTrack* track = [tracksWithFirstLetter objectAtIndex:indexPath.row];
    
    cell.textLabel.text = track.trackName;
    cell.detailTextLabel.text = track.collectionName;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [self.firstLettersArray objectAtIndex:section];
}

- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return self.firstLettersArray;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
    return [self.firstLettersArray indexOfObject:title];
}

@end
