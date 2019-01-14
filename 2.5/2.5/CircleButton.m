//
//  CircleButton.m
//  BasicCoordinate
//
//  Created by Student1 on 9/1/19.
//  Copyright © 2019 ziheng. All rights reserved.
//

#import "CircleButton.h"

@implementation CircleButton
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void) setup{
    self.layer.cornerRadius = self.bounds.size.width / 2.0;
    self.clipsToBounds = true;
    
    self.layer.shadowColor = [UIColor greenColor].CGColor;
    self.layer.shadowOpacity = 0.8;
    self.layer.shadowRadius = 12;
    self.layer.shadowOffset = CGSizeMake(12.0f, 12.0f);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
