//
//  TagCollections.swift
//  DrawApp
//
//  Created by will on 9/04/17.
//  Copyright © 2017 will. All rights reserved.
//

import Foundation
import UIKit

class TagCollections{
    
    private var shapetagValue : Int?
    private var colors : UIColor?
    private var utilityValue : Int?
    enum shapeTag : Int
    {
        case line = 1
        case rect
        case oval
        case diamond
        case pencil
        case eraser = 13
    }
    
    
    enum colorTag : Int
    {
        case red = 6
        case yellow
        case blue
        case green
        case purple
    }

    enum utilityTag : Int
    {
        case erase = 13
    }
    
    init()
    {
        shapetagValue = 0
        colors = UIColor.red
        utilityValue = 0
    }
    
    var shapeTagResult:Int {
        get{
            return shapetagValue!
        }
        set{
            shapetagValue! = newValue
        }
    }
    
    var colorTagResult:UIColor {
        get{
            return colors!
        }
        set{
            colors! = newValue
        }
    }

    
}
