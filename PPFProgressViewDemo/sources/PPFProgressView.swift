//
//  JDP_ProgressView.swift
//  JDPHouseDemolitionManagement
//
//  Created by 潘鹏飞 on 2018/11/26.
//  Copyright © 2018 健德普. All rights reserved.
//

import UIKit

/// 进度条
@IBDesignable
public class PPFGradualProgressView: UIView {
    /// 轨道
    var trackLayer:CAShapeLayer!
    /// 渐变层
    var gradientLayer:CAGradientLayer!
    /// 渐变蒙版
    var gradientMaskLayer:CAShapeLayer!
    
    /// bar的高度
    public private(set) var barHeight:CGFloat = 6
    /// 比例
    public private(set) var rate:NSNumber! = 0
    /// 背景线的颜色
    public private(set) var lineBackgroundColor:UIColor = UIColor(red: 180.0 / 255.0, green: 180.0 / 255, blue: 180.0 / 255, alpha: 1.0)
    
    override init(frame: CGRect) {
        barHeight = frame.size.height
        super.init(frame: frame)
        initializeUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.barHeight = bounds.size.height
        initializeUI()
    }
    
    
    private func initializeUI() {
        backgroundColor = UIColor.clear
        self.clipsToBounds = true
        trackLayer = {
            let l = CAShapeLayer()
            l.lineCap = .round
            self.layer.addSublayer(l)
            return l
        }()
        
        gradientLayer = {
            let l = CAGradientLayer()
            l.colors = [UIColor.gray.cgColor,UIColor.gray.cgColor]
            l.locations = [0,1]
            l.startPoint = CGPoint(x: 0, y: 0.5)
            l.endPoint = CGPoint(x: 1, y: 0.5)
            l.masksToBounds = true
            self.layer.addSublayer(l)
            return l
        }()
        
        gradientMaskLayer = {
            let l = CAShapeLayer()
            l.strokeColor = UIColor.white.cgColor
            l.lineCap = CAShapeLayerLineCap.round
            gradientLayer.mask = l
            return l
        }()
        
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override public func draw(_ rect: CGRect) {
        let orginX = barHeight / 2
        let orginY = rect.height / 2
        
        let path0:UIBezierPath = {
            let p = UIBezierPath()
            
            p.move(to: CGPoint(x: orginX, y: orginY))
            p.addLine(to: CGPoint(x: rect.width - orginX, y: orginY))
            return p
        }()
        
        trackLayer.path = path0.cgPath
        trackLayer.lineWidth = barHeight
        trackLayer.strokeColor = lineBackgroundColor.cgColor
        trackLayer.displayIfNeeded()
        
        gradientMaskLayer.lineWidth = barHeight
        gradientMaskLayer.path = path0.cgPath
        gradientMaskLayer.strokeStart = 0
        gradientMaskLayer.strokeEnd = CGFloat(rate.floatValue)
        trackLayer.displayIfNeeded()
        
        self.gradientLayer.frame = rect
    }
}

extension PPFGradualProgressView {
    /// 设置比例,0.0~1.0
    public func setRate(_ rate:CGFloat) {
        self.rate = rate as NSNumber
        self.gradientMaskLayer.strokeEnd = rate
    }
    
    /// 设置前景色,及位置
    public func setColors(_ colors:[UIColor],locations:[NSNumber] = [0,1]){
        guard colors.count == locations.count else{
            fatalError("PPFGradualProgressView:number of colors is not equal to number of locations")
        }
        guard colors.count > 1 else{
            fatalError("PPFGradualProgressView:number of colors must great than one")
        }
        gradientLayer.colors = colors.compactMap(){ $0.cgColor }
        gradientLayer.locations = locations
    }
    /// 设置前景色,一种颜色
    public func setOneColor(_ color:UIColor){
        setColors([color,color])
    }
    /// 设置轨道颜色
    public func setTrackColor(_ color:UIColor){
        lineBackgroundColor = color
        trackLayer.strokeColor = color.cgColor
    }
    /// 设置
    public func setBarHeight(_ height:CGFloat) {
        self.barHeight = height
        gradientLayer.displayIfNeeded()
        gradientMaskLayer.displayIfNeeded()
        trackLayer.displayIfNeeded()
    }
}
