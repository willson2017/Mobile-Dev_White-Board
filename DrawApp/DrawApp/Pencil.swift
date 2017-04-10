//
//  pencil.swift
//  DrawApp
//
//  Created by will on 9/04/17.
//  Copyright © 2017 will. All rights reserved.
//

import Foundation

import UIKit

class Pencil : Control{
    
    var ct_StartPoint: CGPoint       = CGPointFromString("0")
    var ct_EndPoint  : CGPoint       = CGPointFromString("0")
    var ct_LinePath  : UIBezierPath  = UIBezierPath()
    var ct_layer     : CAShapeLayer  = CAShapeLayer()
    var pencilPoints                 = [CGPoint]()
    
    var setPencilPoints:[CGPoint] {
        set{
            pencilPoints = newValue
        }
        get{
            return pencilPoints
        }
    }
    
    func drawShape(){
        var continuePoints:CGPoint?
        ct_LinePath.lineCapStyle    = .round
        ct_LinePath.lineJoinStyle   = .round
        
        if pencilPoints.count > 0 {
            //move to the startpoint
            ct_LinePath.move(to: ct_StartPoint)
            //print("currentPoint start points: \(pencilPoints[0])")
            
            //draw line from the collection
            for i in 0..<pencilPoints.count {
                ct_LinePath.addLine(to: pencilPoints[i])
                continuePoints = pencilPoints[i]
                ct_LinePath.move(to: continuePoints!)
                //print("print current points \(pencilPoints[i])")
            }
        }
                //print on the layer
        ct_layer.path = ct_LinePath.cgPath
        
    }
}
