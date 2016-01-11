//
//  RadarView.swift
//  NiceRadar
//
//  Created by jyb on 16/1/11.
//  Copyright © 2016年 jyb. All rights reserved.
//

import UIKit

class RadarView: UIView {

    var color = UIColor(red: 0, green: 165.0/255, blue: 0, alpha: 1)//雷达圆圈背景颜色
    var borderColor = UIColor(red: 0, green: 165.0/255, blue: 0, alpha: 1)
    var borderWidth: CGFloat = 1.0
    var pulsingCount: Double = 3 //雷达上波纹的条数
    var duration: Double = 2//一组动画持续的时间，直接决定了动画运行快慢。
    var repeatCount: Float = Float.infinity//正无穷
    
    //代码创建
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        for (var i: Double = 0; i < pulsingCount; i++) {
            let pulsingLayer = CALayer()
            pulsingLayer.frame = CGRectMake(0, 0, rect.size.width, rect.size.height)
            pulsingLayer.backgroundColor = color.CGColor//不设置则为透明
            //pulsingLayer.borderColor = borderColor.CGColor
            //pulsingLayer.borderWidth = borderWidth
            pulsingLayer.cornerRadius = rect.size.height / 2
            
            let animationGroup = CAAnimationGroup()
            animationGroup.fillMode = kCAFillModeBoth
            //因为雷达中每个圆圈的大小不一致，故需要他们在一定的相位差的时刻开始运行。
            animationGroup.beginTime = CACurrentMediaTime() + i * duration / pulsingCount
            animationGroup.duration = duration//每个圆圈从生成到消失的时长，也即动画组每轮动画持续的时长
            animationGroup.repeatCount = repeatCount//0表示动画组持续时间为无限大，也即动画无限循环。
            animationGroup.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
            
            //雷达圆圈初始大小以及最终大小比率。
            let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
            scaleAnimation.removedOnCompletion = false
            scaleAnimation.fromValue = 0.2
            scaleAnimation.toValue = 1.0
            
            //雷达圆圈在n个运行阶段的透明度，n为数组长度。
            let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
            //雷达运行四个阶段不同的透明度。
            opacityAnimation.values = [1.0, 0.5, 0.3, 0.0]
            //雷达运行的不同的四个阶段，为0.0表示刚运行，0.5表示运行了一半，1.0表示运行结束。
            opacityAnimation.keyTimes = [0.0, 0.25, 0.5, 1.0]
            //将两组动画（大小比率变化动画，透明度渐变动画）组合到一个动画组。
            animationGroup.animations = [scaleAnimation, opacityAnimation]
            
            pulsingLayer.addAnimation(animationGroup, forKey: "pulsing")
            self.layer.addSublayer(pulsingLayer)
        }
    }

}
