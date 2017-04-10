//
//  Line.swift
//  DrawApp
//
//  Created by will on 9/04/17.
//  Copyright © 2017 will. All rights reserved.
//

import Foundation
import UIKit

class Line : Control{
    
    var ct_StartPoint: CGPoint       = CGPointFromString("0")
    var ct_EndPoint  : CGPoint       = CGPointFromString("0")
    var ct_LinePath  : UIBezierPath  = UIBezierPath()
    var ct_layer     : CAShapeLayer  = CAShapeLayer()

    func drawShape(){
        ct_LinePath.move(to:ct_StartPoint)
        ct_LinePath.addLine(to: ct_EndPoint)
        ct_layer.path = ct_LinePath.cgPath
    }
}
