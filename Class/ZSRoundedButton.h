//
//  ZSRoundedButton.h
//  ZSRoundedButton
//
//  Created by hzs on 15/7/1.
//  Copyright (c) 2015年 powfulhong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ZSRoundedButtonStyle)
{
    RBS_TopLeft = 0,                    /* 左上角 */
    RBS_TopRight = 1,                   /* 右上角 */
    RBS_BottomLeft = 2,                 /* 左下角 */
    RBS_BottomRight = 3,                /* 右下角 */
    RBS_TopLeft_TopRight = 4,           /* 左上角 & 右上角 */
    RBS_TopLeft_BottomLeft = 5,         /* 左上角 & 左下角 */
    RBS_TopRight_BottomRight = 6,       /* 右上角 & 右下角 */
    RBS_BottomLeft_BottomRight = 7,     /* 左下角 & 右下角 */
    RBS_AllCorner = 8                   /* 全部 */
};

IB_DESIGNABLE
@interface ZSRoundedButton : UIButton

@property(nonatomic, assign)IBInspectable /*ZSRoundedButtonStyle*/NSInteger cornerStyle;
@property(nonatomic, strong)IBInspectable UIColor *borderColor;
@property(nonatomic, assign)IBInspectable CGFloat borderWidth;

@end
