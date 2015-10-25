//
//  GridBackgroundView.m
//  GridBackgroundView
//
//  Created by 王叶庆 on 15/10/25.
//  Copyright © 2015年 王叶庆. All rights reserved.
//

#import "GridBackgroundView.h"
#define SINGLE_LINE_WIDTH           (1 / [UIScreen mainScreen].scale)
#define SINGLE_LINE_ADJUST_OFFSET   ((1 / [UIScreen mainScreen].scale) / 2)

@interface GridBackgroundView ()

@end

@implementation GridBackgroundView

- (instancetype)init {
    if(self = [super init]){
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]){
        [self commonInit];
    }
    return self;
}

- (void)awakeFromNib{
    [self commonInit];
}

- (void)commonInit {
    _lineColor = [UIColor grayColor];
    _edgeLine = GBEdgeLineMake(NO, YES, NO, YES);
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextBeginPath(context);
    [self.lineColor setStroke];
//    CGContextMoveToPoint(context, 0, SINGLE_LINE_ADJUST_OFFSET);
//    CGContextAddLineToPoint(context, CGRectGetWidth(rect), SINGLE_LINE_ADJUST_OFFSET);
//    CGContextSetLineWidth(context, SINGLE_LINE_WIDTH);
//    CGContextStrokePath(context);
    CGFloat width = CGRectGetWidth(self.bounds)/self.column;
    CGFloat height = CGRectGetHeight(self.bounds)/self.row;
    for (int i = 1; i<self.column; i++) {
        CGContextMoveToPoint(context, ceil(width*i)+SINGLE_LINE_ADJUST_OFFSET, 0);
        CGContextAddLineToPoint(context, ceil(width*i)+SINGLE_LINE_ADJUST_OFFSET, CGRectGetHeight(self.bounds));
    }
    for (int i = 1; i<self.row; i++) {
        CGContextMoveToPoint(context, 0, ceil(height*i)+SINGLE_LINE_ADJUST_OFFSET);
        CGContextAddLineToPoint(context, CGRectGetWidth(self.bounds), ceil(height*i)+SINGLE_LINE_ADJUST_OFFSET);
    }
    if(self.edgeLine.top){
        CGContextMoveToPoint(context, 0, SINGLE_LINE_ADJUST_OFFSET);
        CGContextAddLineToPoint(context, CGRectGetWidth(rect), SINGLE_LINE_ADJUST_OFFSET);
    }
    if(self.edgeLine.bottom){
        CGContextMoveToPoint(context, 0, CGRectGetHeight(self.bounds)- SINGLE_LINE_ADJUST_OFFSET);
        CGContextAddLineToPoint(context, CGRectGetWidth(rect), CGRectGetHeight(self.bounds)- SINGLE_LINE_ADJUST_OFFSET);
    }
    if(self.edgeLine.left){
        CGContextMoveToPoint(context, SINGLE_LINE_ADJUST_OFFSET, 0);
        CGContextAddLineToPoint(context, SINGLE_LINE_ADJUST_OFFSET, CGRectGetHeight(self.bounds));
    }
    if (self.edgeLine.right){
        CGContextMoveToPoint(context, CGRectGetWidth(self.bounds)-SINGLE_LINE_ADJUST_OFFSET, 0);
        CGContextAddLineToPoint(context, CGRectGetWidth(self.bounds)-SINGLE_LINE_ADJUST_OFFSET, CGRectGetHeight(self.bounds));
    }
    
    CGContextSetLineWidth(context, SINGLE_LINE_WIDTH);
    CGContextStrokePath(context);
    
}

#pragma mark set get
- (void)setLineColor:(UIColor *)lineColor{
    if(_lineColor != lineColor){
        _lineColor = lineColor;
        [self setNeedsDisplay];
    }
}
- (void)setRow:(NSInteger)row{
    if(_row!=row){
        _row = row;
        [self setNeedsDisplay];
    }
}
- (void)setColumn:(NSInteger)column{
    if(_column!=column){
        _column = column;
        [self setNeedsDisplay];
    }
}
- (void)setEdgeLine:(GBEdgeLine)edgeLine{
    _edgeLine = edgeLine;
    [self setNeedsDisplay];
}
@end
