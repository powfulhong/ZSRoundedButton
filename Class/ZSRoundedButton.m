//
//  ZSRoundedButton.m
//  ZSRoundedButton
//
//  Created by hzs on 15/7/1.
//  Copyright (c) 2015年 powfulhong. All rights reserved.
//

#import "ZSRoundedButton.h"
#import <QuartzCore/QuartzCore.h>

@interface ZSRoundedButton ()
{
    UIRectCorner _corners;
}

@end

@implementation ZSRoundedButton

- (void)dealloc
{
    _borderColor = nil;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat half_height = self.bounds.size.height / 2;

    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                     byRoundingCorners:_corners
                                                           cornerRadii:CGSizeMake(half_height, half_height)];
    /* 蒙版 */
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = self.bounds;
    maskLayer.path = bezierPath.CGPath;
    self.layer.masksToBounds = YES;
    self.layer.mask = maskLayer;
    
    /* 边框蒙版 */
    CAShapeLayer *borderMaskLayer = [CAShapeLayer layer];
    borderMaskLayer.path = bezierPath.CGPath;
    borderMaskLayer.fillColor = [UIColor clearColor].CGColor;
    borderMaskLayer.strokeColor = _borderColor.CGColor;
    borderMaskLayer.lineWidth = _borderWidth;
    [self.layer addSublayer:borderMaskLayer];
}

- (void)setBorderColor:(UIColor *)borderColor
{
    _borderColor = borderColor;
}

- (void)setBorderWidth:(CGFloat)borderWidth
{
    _borderWidth = borderWidth;
}

- (void)setCornerStyle:(NSInteger)cornerStyle
{
    _cornerStyle = cornerStyle;
    
    switch (self.cornerStyle) {
        case RBS_TopLeft: {
            _corners = UIRectCornerTopLeft;
            break;
        }
            
        case RBS_TopRight: {
            _corners = UIRectCornerTopRight;
            break;
        }
            
        case RBS_BottomLeft: {
            _corners = UIRectCornerBottomLeft;
            break;
        }
            
        case RBS_BottomRight: {
            _corners = UIRectCornerBottomRight;
            break;
        }
            
        case RBS_TopLeft_TopRight: {
            _corners = UIRectCornerTopLeft | UIRectCornerTopRight;
            break;
        }
            
        case RBS_TopLeft_BottomLeft: {
            _corners = UIRectCornerTopLeft | UIRectCornerBottomLeft;
            break;
        }
            
        case RBS_TopRight_BottomRight: {
            _corners = UIRectCornerTopRight | UIRectCornerBottomRight;
            break;
        }
            
        case RBS_BottomLeft_BottomRight: {
            _corners = UIRectCornerBottomLeft | UIRectCornerBottomRight;
            break;
        }
            
        case RBS_AllCorner:
        default: {
            _corners = UIRectCornerAllCorners;
            break;
        }
    }
}

@end
