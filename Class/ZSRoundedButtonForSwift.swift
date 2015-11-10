//
//  ZSRoundedButtonForSwift.swift
//  ZSRoundedButton
//
//  Created by hzs on 15/7/14.
//  Copyright (c) 2015年 powfulhong. All rights reserved.
//

import UIKit

enum ZSRoundedButtonStyle: Int {
    case RBS_TopLeft = 0                    /* 左上角 */
    case RBS_TopRight = 1                   /* 右上角 */
    case RBS_BottomLeft = 2                 /* 左下角 */
    case RBS_BottomRight = 3                /* 右下角 */
    case RBS_TopLeft_TopRight = 4           /* 左上角 & 右上角 */
    case RBS_TopLeft_BottomLeft = 5         /* 左上角 & 左下角 */
    case RBS_TopRight_BottomRight = 6       /* 右上角 & 右下角 */
    case RBS_BottomLeft_BottomRight = 7     /* 左下角 & 右下角 */
    case RBS_AllCorner = 8                  /* 全部 */
    case RBS_None = 9                       /* None */
}

@IBDesignable
class ZSRoundedButtonForSwift: UIButton {
    @IBInspectable var cornerStyle: Int = 8 {
        didSet {
            if let style = ZSRoundedButtonStyle(rawValue: cornerStyle) {
                switch style {
                case .RBS_TopLeft:
                    corners = UIRectCorner.TopLeft
                    
                case .RBS_TopRight:
                    corners = UIRectCorner.TopRight
                    
                case .RBS_BottomLeft:
                    corners = UIRectCorner.BottomLeft
                    
                case .RBS_BottomRight:
                    corners = UIRectCorner.BottomRight
                    
                case .RBS_TopLeft_TopRight:
                    corners = [UIRectCorner.TopLeft, UIRectCorner.TopRight]
                    
                case .RBS_TopLeft_BottomLeft:
                    corners = [UIRectCorner.TopLeft, UIRectCorner.BottomLeft]
                    
                case .RBS_TopRight_BottomRight:
                    corners = [UIRectCorner.TopRight, UIRectCorner.BottomRight]
                    
                case .RBS_BottomLeft_BottomRight:
                    corners = [UIRectCorner.BottomLeft, UIRectCorner.BottomRight]
                    
                case .RBS_None:
                    corners = nil
                    
                case .RBS_AllCorner:
                    corners = UIRectCorner.AllCorners
                }
            } else {
                corners = nil
            }
        }
    }
    
    @IBInspectable var borderColor: UIColor? 
    
    @IBInspectable var borderWidth: CGFloat = 0
    
    var corners: UIRectCorner?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.contentEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 5)
        
        let half_height: CGFloat = self.bounds.size.height / 2
        let bezierPath: UIBezierPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners ?? [], cornerRadii: CGSizeMake(half_height, half_height))
        
        /* 蒙版 */
        let maskLayer: CAShapeLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = bezierPath.CGPath
        self.layer.masksToBounds = true
        self.layer.mask = maskLayer
        
        /* 边框蒙版 */
        let borderMaskLayer: CAShapeLayer = CAShapeLayer()
        borderMaskLayer.path = bezierPath.CGPath
        borderMaskLayer.fillColor = UIColor.clearColor().CGColor
        borderMaskLayer.strokeColor = borderColor?.CGColor
        borderMaskLayer.lineWidth = borderWidth
        self.layer.addSublayer(borderMaskLayer)
    }
}
