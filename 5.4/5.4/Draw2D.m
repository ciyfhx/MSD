//
//  Draw2D.m
//  5.4
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
//    CGContextMoveToPoint(context, 100, 100);
//    CGContextAddArcToPoint(context, 100, 200, 300, 200, 100);
//
//    CGContextStrokePath(context);

    
    
//    CGContextRef context = UIGraphicsGetCurrentContext();
//
//    CGContextSetLineWidth(context, 2.0);
//
//    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
//
//    CGContextMoveToPoint(context, 10, 10);
//    CGContextAddCurveToPoint(context, 0, 200, 300, 200, 300, 400);
//
//    CGContextStrokePath(context);

    
    
    
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSetLineWidth(context, 2.0);

    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);

    CGContextMoveToPoint(context, 10, 100);
    CGContextAddQuadCurveToPoint(context, 150, 200, 300, 100);

    CGContextStrokePath(context);
    
    
}


@end
