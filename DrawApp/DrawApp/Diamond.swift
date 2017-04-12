//
//  diamond.swift
//  DrawApp
//
//  Created by will on 9/04/17.
//  Copyright © 2017 will. All rights reserved.
//

import Foundation
import UIKit

class Diamond : Control{
    
    var ct_StartPoint: CGPoint       = CGPointFromString("0")
    var ct_EndPoint  : CGPoint       = CGPointFromString("0")
    var ct_LinePath  : UIBezierPath  = UIBezierPath()
    var ct_layer     : CAShapeLayer  = CAShapeLayer()
    
    var drawView:UIView = UIView()
    
    var view_Set_Get:UIView {
        get {
            return drawView
        }
        set {
            drawView = newValue
        }
    }
    
    func drawShape(){
        let pointX = ct_StartPoint.x-(ct_EndPoint.x-ct_StartPoint.x)
        let pointY = ct_EndPoint.y + (ct_EndPoint.y - ct_StartPoint.y)
        if (pointY >= 0 && pointY <= drawView.bounds.height)
           && (pointX >= 0 && pointX <= drawView.bounds.width){
        ct_LinePath.move(to:ct_StartPoint)
        ct_LinePath.addLine(to: CGPoint(x: ct_EndPoint.x, y: ct_EndPoint.y))
        ct_LinePath.addLine(to: CGPoint(x: ct_StartPoint.x, y: ct_EndPoint.y + (ct_EndPoint.y - ct_StartPoint.y)))
        ct_LinePath.addLine(to: CGPoint(x: ct_StartPoint.x-(ct_EndPoint.x-ct_StartPoint.x), y: ct_EndPoint.y))
        ct_LinePath.addLine(to: ct_StartPoint)
        ct_layer.path = ct_LinePath.cgPath
        ct_layer.strokeColor = UIColor.cyan.cgColor
        }
    }
}
