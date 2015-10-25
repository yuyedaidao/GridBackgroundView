//
//  GridBackgroundView.h
//  GridBackgroundView
//
//  Created by 王叶庆 on 15/10/25.
//  Copyright © 2015年 王叶庆. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef struct {
    BOOL top;
    BOOL bottom;
    BOOL left;
    BOOL right;
}GBEdgeLine;

FOUNDATION_STATIC_INLINE GBEdgeLine GBEdgeLineMake(BOOL left,BOOL top,BOOL right,BOOL bottom){
    GBEdgeLine el;
    el.left = left;
    el.top = top;
    el.right = right;
    el.bottom = bottom;
    return el;
}

@interface GridBackgroundView : UIView

@property (nonatomic, strong) IBInspectable UIColor *lineColor;
@property (nonatomic, assign) IBInspectable NSInteger column;
@property (nonatomic, assign) IBInspectable NSInteger row;
@property (nonatomic, assign) GBEdgeLine edgeLine;
@end
