//
//  iTunesTrack.h
//  6.2
//
//  Created by Student1 on 31/1/19.
//  Copyright © 2019 ziheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface iTunesTrack : NSObject

@property(nonatomic, strong) NSString* trackName;
@property(nonatomic, strong) NSString* collectionName;
@property(nonatomic, strong) NSString* previewUrlString;
@property(nonatomic, strong) NSString* iTunesUrlString;

@end
