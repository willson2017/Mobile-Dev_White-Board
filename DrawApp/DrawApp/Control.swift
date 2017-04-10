//
//  control.swift
//  DrawApp
//
//  Created by will on 9/04/17.
//  Copyright © 2017 will. All rights reserved.
//

import Foundation
import UIKit

protocol Control {
    var ct_StartPoint: CGPoint {get set}
    var ct_EndPoint  : CGPoint {get set}
    var ct_LinePath  : UIBezierPath {get set}
    var ct_layer     : CAShapeLayer {get set}
    
    func drawShape()
}
