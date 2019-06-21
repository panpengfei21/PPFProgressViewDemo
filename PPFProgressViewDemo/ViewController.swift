//
//  ViewController.swift
//  PPFProgressViewDemo
//
//  Created by 潘鹏飞 on 2019/6/21.
//  Copyright © 2019 潘鹏飞. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    weak var pView:PPFGradualProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initializeUIs()
    }

    private func initializeUIs() {
        pView = {
            let pv = PPFGradualProgressView(frame: CGRect(x: 100, y: 100, width: 200, height: 30))
            // 设置渐变色
            pv.setColors([UIColor.red,UIColor.purple])
            // 设置bar的高度
            pv.setBarHeight(40)
            // 设置轨道的颜色
            pv.setTrackColor(UIColor.gray)
            // 设置比例
            pv.setRate(0.8)
            view.addSubview(pv)
            return pv
        }()
    }

    @IBAction func tapForButton(_ sender: Any) {
        pView.setRate(CGFloat(arc4random_uniform(100)) / 100.0)
        
        pView.setTrackColor(UIColor(white: CGFloat(arc4random_uniform(100)) / 100.0, alpha: 1.0))
    }
}

