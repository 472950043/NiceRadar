//
//  CircleView.swift
//  NiceRadar
//
//  Created by jyb on 16/1/11.
//  Copyright © 2016年 jyb. All rights reserved.
//

import UIKit

class CircleView: UIView {

    var borderColor = UIColor(red: 0, green: 165.0/255, blue: 0, alpha: 1)
    var borderWidth: CGFloat = 0.5
    var pulsingCount: CGFloat = 3 //雷达上波纹的条数
    
    //代码创建
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        //边框圆
        let context = UIGraphicsGetCurrentContext()
        CGContextSetStrokeColorWithColor(context, borderColor.colorWithAlphaComponent(0.5).CGColor)//画笔线的颜色
        CGContextSetLineWidth(context, borderWidth)//线的宽度
        for (var i: CGFloat = 1; i <= pulsingCount; i++) {
            let radius = (self.frame.height / 2 - borderWidth) * i / pulsingCount
            CGContextAddArc(context, self.center.x, self.center.y, radius, 0, 2 * CGFloat(M_PI), 1)//画一个扇形
            CGContextDrawPath(context, CGPathDrawingMode.Stroke) //绘制路径
        }
    }

}
