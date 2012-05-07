//
//  DarkDisclosureIndicator.m
//  ScalePractice
//
//  Created by Max Woolf on 06/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DarkDisclosureIndicator.h"

@implementation DarkDisclosureIndicator

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
     // (x,y) is the tip of the arrow
     CGFloat x = CGRectGetMaxX(self.bounds) - 5.0f;
     CGFloat y = CGRectGetMidY(self.bounds);
     const CGFloat R = 4.5;
     CGContextRef ctxt = UIGraphicsGetCurrentContext();
     CGContextMoveToPoint(ctxt, x-R, y-R);
     CGContextAddLineToPoint(ctxt, x, y);
     CGContextAddLineToPoint(ctxt, x-R, y+R);
     CGContextSetLineCap(ctxt, kCGLineCapSquare);
     CGContextSetLineJoin(ctxt, kCGLineJoinMiter);
     CGContextSetLineWidth(ctxt, 3);
     // If the cell is highlighted (blue background) draw in white; otherwise gray
     CGContextSetRGBStrokeColor(ctxt, 1, 1, 1, 1);
     CGContextStrokePath(ctxt);
}


@end
