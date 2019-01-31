//
//  iTunesTrack.m
//  6.2
//
//  Created by Student1 on 31/1/19.
//  Copyright © 2019 ziheng. All rights reserved.
//

#import "iTunesTrack.h"

@implementation iTunesTrack

- (NSComparisonResult) compare:(iTunesTrack*) otherObject{
    return [self.trackName compare:otherObject.trackName];
}



@end
