//
//  DetailsViewController.h
//  6.2
//
//  Created by Student1 on 31/1/19.
//  Copyright © 2019 ziheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailsViewController : UITableViewController

@property (nonatomic, weak) NSString* searchTerm;
- (void) searchForTracks;
@end
