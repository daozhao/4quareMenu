//
//  MaskView.m
//  4quareMenu
//
//  Created by chen daozhao on 13-3-21.
//  Copyright (c) 2013年 chen daozhao. All rights reserved.
//

#import "MaskView.h"

@implementation MaskView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    
//    CGContextSetRGBFillColor(context,   0.0, 0.0, 0.0, 0.35);
    CGContextSetRGBFillColor(context, 1, 1, 1, .60);
    CGContextSetRGBStrokeColor(context, 1, 1, 1, .80);
//    CGContextSetRGBStrokeColor(context, 0.6, 0.6, 0.6, 1.0);
    
    CGRect clips[] = {rect};
    CGContextClipToRects(context, clips, sizeof(clips) / sizeof(clips[0]));
    
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineWidth(context, 3.0);
    
    CGContextFillRect(context, self.bounds);
    CGContextStrokeRect(context, self.bounds);
    UIGraphicsEndImageContext();
}

@end
