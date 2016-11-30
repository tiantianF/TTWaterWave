//
//  TTWaterWaveView.swift
//  
//
//  Created by tiantianfang on 2016/11/30.
//  Copyright © 2016年 fangtiantian. All rights reserved.
//

import UIKit

class TTWaterWaveView: UIView {
    
    var speed : CGFloat = 3             //波浪速度  默认3
    var offSetX : CGFloat = 0
    var waveAmplitude : CGFloat = 8     //波浪振幅  默认  8
    var waveWidth : CGFloat?            //波浪宽   默认view 宽
    var waveHeight : CGFloat?           //波浪高   默认view 高

    
    var headImage : UIImageView? = nil  //头像
    
    private var displayLink : CADisplayLink?
    private var shaperLayer : CAShapeLayer?
    private var shaperLayerS : CAShapeLayer?
    
    var topColor : UIColor {
        didSet{
            self.shaperLayer?.fillColor = topColor.cgColor
        }
    }//上部颜色   默认红色
    
    override init(frame: CGRect) {
        topColor = UIColor.red
        
        super.init(frame: frame)
        
        self.initViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initViews(){
        //displayLink
        self.displayLink = CADisplayLink.init(target: self, selector: #selector(self.reflashLayer))
        self.displayLink?.add(to: RunLoop.main, forMode: .commonModes)
        
        //shaperLayer
        self.shaperLayer = CAShapeLayer.init()
        self.shaperLayer?.fillColor = UIColor.red.cgColor
        self.layer.addSublayer(self.shaperLayer!)
        
        //image
        self.headImage = UIImageView.init(frame: CGRect.init(x: (self.width()-40)/2.0, y: 0, width: 40, height: 40))
        self.headImage?.backgroundColor = UIColor.orange
        self.headImage?.layer.cornerRadius = 20
        self.headImage?.layer.borderWidth = 2
        self.headImage?.layer.borderColor = UIColor.white.cgColor
        self.addSubview(self.headImage!)
        
        //shaperLayerS
        self.shaperLayerS = CAShapeLayer.init()
        self.shaperLayerS?.fillColor = UIColor.white.cgColor
        self.shaperLayerS?.opacity = 0.5
        self.layer.addSublayer(self.shaperLayerS!)
        
        self.waveWidth = self.width()
        self.waveHeight = self.height()-self.waveAmplitude-16
        
        self.backgroundColor = UIColor.white
        self.layer.masksToBounds = true
    }
    
    func reflashLayer(){
        
        //外层
        self.offSetX += self.speed
        
        let path = CGMutablePath.init()
        
        path.move(to: CGPoint.init(x: 0, y: 0))
        
        var y : CGFloat = 0.0
        var sinx : CGFloat = 0.0
        
        
        for var x in stride(from: 0, to: self.waveWidth!, by: 0.1){
            
            sinx = sin((300 / self.waveWidth!) * (x * CGFloat( M_PI / 180 ))  - self.offSetX * CGFloat( M_PI / 270))
            y = self.waveAmplitude * sinx + self.waveHeight!
            path.addLine(to: CGPoint.init(x: x, y: y))
            
            if x == (self.width()-40)/2.0{
                self.headImage?.frame = CGRect.init(x: (self.width()-40)/2.0, y: y-37, width: 40, height: 40)
            }
        }
        
        path.addLine(to: CGPoint.init(x: self.waveWidth!, y: 0))
        path.addLine(to: CGPoint.init(x: 0, y: 0))
        
        path.closeSubpath()
        
        self.shaperLayer!.path = path

        //内层
        let pathS = CGMutablePath.init()
        pathS.move(to: CGPoint.init(x: 0, y: self.height()))
        
        var yS : CGFloat = 0.0
        var sinxS : CGFloat = 0.0
        
        for var x in stride(from: 0, to: self.waveWidth!, by: 0.1){
            sinxS = sin((300 / self.waveWidth!) * (x * CGFloat(M_PI / 180)) + CGFloat( M_PI) - self.offSetX * CGFloat( M_PI / 270))
            yS = self.waveAmplitude*0.8  * sinxS + self.waveHeight!+self.waveAmplitude-2
            pathS.addLine(to: CGPoint.init(x: x, y: yS))
        }
        
        pathS.addLine(to: CGPoint.init(x: self.waveWidth!, y: self.height()))
        pathS.addLine(to: CGPoint.init(x: 0, y: self.height()))
        
        pathS.closeSubpath()
        
        self.shaperLayerS!.path = pathS
    }

}
