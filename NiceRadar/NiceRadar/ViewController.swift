//
//  ViewController.swift
//  NiceRadar
//
//  Created by jyb on 16/1/11.
//  Copyright © 2016年 jyb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var view1: UIView!
    @IBOutlet var view2: UIView!
    @IBOutlet var view3: UIView!
    
    @IBOutlet var radarView: RadarView!
    @IBOutlet var circleView: CircleView!
    @IBOutlet var indicator1: IndicatorView!
    @IBOutlet var indicator2: IndicatorView!
    @IBOutlet var indicator3: IndicatorView!
    
    @IBOutlet var radar: UIView!
    var niceRadar: Radar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //作者QQ472950043
        view1.backgroundColor = nil
        view2.backgroundColor = nil
        view3.backgroundColor = nil
        
        radarView.backgroundColor = UIColor.clearColor()
        circleView.backgroundColor = UIColor.clearColor()
        indicator1.backgroundColor = UIColor.clearColor()
        indicator2.backgroundColor = UIColor.clearColor()
        indicator3.backgroundColor = UIColor.clearColor()
        
        niceRadar = Radar.instanceRadar()
        niceRadar.frame = radar.bounds
        radar.addSubview(niceRadar)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

