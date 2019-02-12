//
//  Draw2D.m
//  Face
//
//  Created by Student1 on 12/2/19.
//  Copyright © 2019 ziheng. All rights reserved.
//

#import "Draw2D.h"

@implementation Draw2D


- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 2.0);
    
    CGContextSetFillColorWithColor(context, [UIColor blueColor].CGColor);
    
    int width = rect.size.width;
    int height = 600;
    
    //Draw eye
    int eyeSize = 65;
    int eyeOffsetPadding = 90;
    int eyeTopOffsetPadding = 40;
    CGRect eye1 = CGRectMake(eyeOffsetPadding, eyeOffsetPadding + eyeTopOffsetPadding, eyeSize, eyeSize);
    CGRect eye2 = CGRectMake(width - eyeOffsetPadding - eyeSize, eyeOffsetPadding + eyeTopOffsetPadding, eyeSize, eyeSize);
    
    CGContextFillEllipseInRect(context, eye1);
    CGContextFillEllipseInRect(context, eye2);
    
    
    //Draw Nose
    static int size = 50;
    int noseHeight = height*.4;
    [self drawTriangle:context withX:(width/2) - (size/2) withY:noseHeight withSize:size];
    
    //Draw Mouth
    int mouthHeight = height * 0.55;
    int mouthPadding = 30;

    switch(_emotion){
        case Glad:
        {
            int smileRadius = 150;
            CGContextMoveToPoint(context, mouthPadding, mouthHeight);
            CGContextAddQuadCurveToPoint(context, width/2, mouthHeight+smileRadius, width - mouthPadding, mouthHeight);
            break;
        }
            
        case Sad:
        {
            int sadRadius = 150;
            CGContextMoveToPoint(context, mouthPadding, mouthHeight+sadRadius);
            CGContextAddQuadCurveToPoint(context, width/2, mouthHeight, width - mouthPadding, mouthHeight+sadRadius);
            break;
        }
        case Mad:
        {
            int size = 150;
            CGContextMoveToPoint(context, mouthPadding, mouthHeight);
            CGContextAddLineToPoint(context, width - mouthPadding, mouthHeight+size);
            CGContextMoveToPoint(context, width - mouthPadding, mouthHeight);
            CGContextAddLineToPoint(context, mouthPadding, mouthHeight+size);
            break;
        }
            
    }
    CGContextStrokePath(context);
    
}


- (void) drawTriangle:(CGContextRef)context withX:(CGFloat) x withY:(CGFloat) y withSize: (CGFloat) size{
    CGPoint triangle[] = {CGPointMake(x + size/2, y), CGPointMake(x, y + size), CGPointMake(x + size, y + size), CGPointMake(x + size/2, y)};
    CGContextAddLines(context, triangle, 4);
    CGContextStrokePath(context);
}


@end
