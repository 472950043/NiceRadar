//
//  Radar.swift
//  NiceRadar
//
//  Created by jyb on 16/1/11.
//  Copyright © 2016年 jyb. All rights reserved.
//

import UIKit

class Radar: UIView {
    
    @IBOutlet var indicator: IndicatorView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    class func instanceRadar() -> Radar{
        // type method implementation goes here
        return NSBundle.mainBundle().loadNibNamed("Radar", owner: nil, options: nil).first as! Radar
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        初始化()
    }
    
    func 初始化(){
        indicator.backgroundColor = UIColor.clearColor()
    }
    
}
