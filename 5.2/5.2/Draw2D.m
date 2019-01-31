//
//  Draw2D.m
//  5.2
//
//  Created by Student1 on 31/1/19.
//  Copyright © 2019 ziheng. All rights reserved.
//

#import "Draw2D.h"

@implementation Draw2D


- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 2.0);
    
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGFloat components[] = {0.0, 0.0, 1.0, 1.0};
    CGColorRef color = CGColorCreate(colorspace, components);
    
    CGContextSetStrokeColorWithColor(context, color);
    
    CGContextMoveToPoint(context, 30, 30);
    CGContextAddLineToPoint(context, 300, 400);
    CGContextStrokePath(context);
    
    CGColorSpaceRelease(colorspace);
    CGColorRelease(color);
}

@end
