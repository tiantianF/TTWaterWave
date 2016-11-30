//
//  ViewController.swift
//  TTWaterWave
//
//  Created by tiantianfang on 2016/11/30.
//  Copyright © 2016年 fangtiantian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var waveView : TTWaterWaveView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.gray
        self.waveView = TTWaterWaveView.init(frame: CGRect.init(x: 0, y: 200, width: self.view.width(), height: 150))
        self.view.addSubview(self.waveView!)
//        self.waveView?.speed = 20
//        self.waveView?.topColor = UIColor.green
        self.waveView?.waveAmplitude = 5

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

