//
//  Draw2D.h
//  Face
//
//  Created by Student1 on 12/2/19.
//  Copyright © 2019 ziheng. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, Emotion) {Glad = 0, Sad = 1, Mad = 2};

@interface Draw2D : UIView

@property(assign, nonatomic) Emotion emotion;

@end
