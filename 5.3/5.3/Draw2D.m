//
//  Draw2D.m
//  5.3
//
//  Created by Student1 on 31/1/19.
//  Copyright © 2019 ziheng. All rights reserved.
//

#import "Draw2D.h"

@implementation Draw2D

- (void)drawRect:(CGRect)rect {
//    CGContextRef context = UIGraphicsGetCurrentContext();
//
//    CGContextSetLineWidth(context, 2.0);
//
//    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
//
//    CGContextMoveToPoint(context, 60, 170);
//
//    CGContextAddLineToPoint(context, 260, 170);
//    CGContextAddLineToPoint(context, 260, 250);
//    CGContextAddLineToPoint(context, 60, 250);
//    CGContextAddLineToPoint(context, 60, 170);
    
//    CGContextStrokePath(context);
    
    
    
    
//    CGContextRef context = UIGraphicsGetCurrentContext();
//
//    CGContextSetLineWidth(context, 2.0);
//
//    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
//
//    CGRect rectangle = CGRectMake(60, 170, 200, 80);
//    CGContextAddRect(context, rectangle);
//
//    CGContextStrokePath(context);

    
    
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSetLineWidth(context, 2.0);

    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);

    CGRect rectangle = CGRectMake(60, 170, 200, 80);
    CGContextAddEllipseInRect(context, rectangle);

    CGContextStrokePath(context);
    
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    CGContextFillEllipseInRect(context, rectangle);
    
    
}


@end
