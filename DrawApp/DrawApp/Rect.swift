//
//  rect.swift
//  DrawApp
//
//  Created by will on 9/04/17.
//  Copyright © 2017 will. All rights reserved.
//

import Foundation
import UIKit

class Rect : Control{
    
    var ct_StartPoint: CGPoint       = CGPointFromString("0")
    var ct_EndPoint  : CGPoint       = CGPointFromString("0")
    var ct_LinePath  : UIBezierPath  = UIBezierPath()
    var ct_layer     : CAShapeLayer  = CAShapeLayer()
    
    func drawShape(){
        ct_layer.path = UIBezierPath(rect: CGRect(x: ct_StartPoint.x, y: ct_StartPoint.y,
                                                    width: ct_EndPoint.x, height: ct_EndPoint.y)).cgPath
    }
}
