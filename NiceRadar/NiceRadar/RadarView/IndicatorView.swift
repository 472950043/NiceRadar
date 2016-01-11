//
//  IndicatorView.swift
//  NiceRadar
//
//  Created by jyb on 16/1/11.
//  Copyright © 2016年 jyb. All rights reserved.
//

import UIKit

class IndicatorView: UIView {
    
    let color = UIColor(red: 55.0/255, green: 236.0/255, blue: 102.0/255, alpha: 1)
    var repeatCount: Float = Float.infinity//正无穷
    var borderColor = UIColor(red: 0, green: 165.0/255, blue: 0, alpha: 1)
    var borderWidth: CGFloat = 1.0
    
    //代码创建
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
        let context = UIGraphicsGetCurrentContext()
        //90个小扇形构造渐变的直角扇形
        for (var i: CGFloat = 0; i <= 180; i++) {
            let shadowColor = color.colorWithAlphaComponent(i / 500).CGColor//计算扇形填充颜色
            CGContextSetFillColorWithColor(context, shadowColor)
            CGContextMoveToPoint(context, self.center.x, self.center.y)//指定圆心
            CGContextAddArc(context, self.center.x, self.center.y, self.frame.height / 2, (-180 + i) / 180 * CGFloat(M_PI), (-180 + i - 1) / 180 * CGFloat(M_PI), 1)//画一个扇形
            CGContextClosePath(context)//封闭形状
            CGContextDrawPath(context, CGPathDrawingMode.Fill)//绘制扇形
        }
        //指针，默认宽度为1
        CGContextSetStrokeColorWithColor(context, color.colorWithAlphaComponent(0.9).CGColor)
        CGContextMoveToPoint(context, self.center.x, self.center.y)
        CGContextAddLineToPoint(context, self.frame.height, self.center.y)
        CGContextStrokePath(context)
        
        //扫描动画
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotateAnimation.toValue = 2 * M_PI// 终止角度
        rotateAnimation.duration = 2
        rotateAnimation.removedOnCompletion = false
        rotateAnimation.repeatCount = repeatCount
        self.layer.addAnimation(rotateAnimation, forKey: "rotate-layer")
    }

}
