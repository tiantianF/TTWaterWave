//
//  UIView+Extension.swift
//  DemoSwift
//
//  Created by tiantianfang on 2016/11/28.
//  Copyright © 2016年 fangtiantian. All rights reserved.
//

import UIKit

extension UIView{
    
    func left() -> CGFloat{
        return self.frame.origin.x
    }
    
    func right() -> CGFloat{
        return self.frame.origin.x + self.frame.size.width
    }
    
    func top() -> CGFloat{
        return self.frame.origin.y
    }
    
    func bottom() -> CGFloat{
        return self.frame.origin.y + self.frame.size.height
    }
    
    func height() -> CGFloat{
        return self.frame.size.height
    }
    
    func width() -> CGFloat
    {
        return self.frame.size.width
    }
}
