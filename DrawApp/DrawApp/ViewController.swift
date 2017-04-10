//
//  ViewController.swift
//  DrawApp
//
//  Created by will on 8/04/17.
//  Copyright © 2017 will. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redBtn: UIButton!
    @IBOutlet weak var yellowBtn: UIButton!
    @IBOutlet weak var greenBtn: UIButton!
    @IBOutlet weak var blueBtn: UIButton!
    @IBOutlet weak var purpleBtn: UIButton!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var deleteBtn: UIButton!
    @IBOutlet weak var eraseBtn: UIButton!

    @IBOutlet weak var shapeView: UIStackView!
    @IBOutlet weak var DrawAreaView: UIView!
    
    var btnTag:TagCollections = TagCollections()
    var layer : CAShapeLayer?
    var startPoint : CGPoint = CGPointFromString("0")
    var endPoint   : CGPoint = CGPointFromString("0")
    var currentPointArray    = [CGPoint]()
    var layerArray           = [CAShapeLayer]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // change the button 's corner
        let btnArray:[UIButton] = [redBtn, yellowBtn, greenBtn, blueBtn, purpleBtn]
    
        for btn in btnArray{
            btn.layer.cornerRadius = 10
            btn.clipsToBounds = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    ////Code Area Start ////

    @IBAction func GetTag_ButtonClick(_ sender: UIButton) {
        
        let tag = sender.tag
        switch tag {
        case TagCollections.shapeTag.line.rawValue:
           btnTag.shapeTagResult = TagCollections.shapeTag.line.rawValue
            
        case TagCollections.shapeTag.rect.rawValue:
            btnTag.shapeTagResult = TagCollections.shapeTag.rect.rawValue
            
        case TagCollections.shapeTag.oval.rawValue:
            btnTag.shapeTagResult = TagCollections.shapeTag.oval.rawValue
            
        case TagCollections.shapeTag.diamond.rawValue:
             btnTag.shapeTagResult = TagCollections.shapeTag.diamond.rawValue
            
        case TagCollections.shapeTag.pencil.rawValue:
            btnTag.shapeTagResult = TagCollections.shapeTag.pencil.rawValue
            
        case TagCollections.colorTag.red.rawValue:
             btnTag.colorTagResult = UIColor.red
            
        case TagCollections.colorTag.yellow.rawValue:
            btnTag.colorTagResult = UIColor.yellow
            
        case TagCollections.colorTag.blue.rawValue:
            btnTag.colorTagResult = UIColor.blue

        case TagCollections.colorTag.green.rawValue:
            btnTag.colorTagResult = UIColor.green
            
        case TagCollections.colorTag.purple.rawValue:
            btnTag.colorTagResult = UIColor.purple
         
        case TagCollections.shapeTag.eraser.rawValue:
            btnTag.shapeTagResult = TagCollections.shapeTag.eraser.rawValue
        default:
            break
        }
    }
    
    func layer_Init() {
        layer = CAShapeLayer()
        if btnTag.shapeTagResult == TagCollections.shapeTag.eraser.rawValue {
            layer?.fillColor = UIColor.white.cgColor
            layer?.opacity = 1.0
            layer?.strokeColor = UIColor.white.cgColor
        } else {
            layer?.fillColor = btnTag.colorTagResult.cgColor
            layer?.opacity = 0.5
            layer?.strokeColor = btnTag.colorTagResult.cgColor
        }
       
    }
    
    
    @IBAction func drawPictures(_ sender: UIPanGestureRecognizer) {
        let linePath = UIBezierPath()
        
        if sender.state == .began{
            startPoint = sender.location(in: sender.view)
            layer_Init()
            self.view.layer.addSublayer(self.layer!)
            layerArray.append(layer!)
            
        }else if sender.state == .changed{
            endPoint = sender.location(in: sender.view)
            switch btnTag.shapeTagResult{
            case TagCollections.shapeTag.line.rawValue:
                let myLine = Line()
                myLine.ct_StartPoint = self.startPoint
                myLine.ct_EndPoint   = self.endPoint
                myLine.ct_LinePath   = linePath
                myLine.ct_layer      = layer!
                myLine.drawShape()
            
            case TagCollections.shapeTag.rect.rawValue:
                let myRect = Rect()
                myRect.ct_StartPoint = self.startPoint
                myRect.ct_EndPoint   = sender.translation(in: sender.view)
                myRect.ct_layer = layer!
                myRect.drawShape()
            
            case TagCollections.shapeTag.oval.rawValue:
                let myOval = Eclipse()
                myOval.ct_StartPoint = self.startPoint
                myOval.ct_EndPoint   = sender.translation(in: sender.view)
                myOval.ct_layer = layer!
                myOval.drawShape()

            case TagCollections.shapeTag.diamond.rawValue:
                let myDiamond = Diamond()
                myDiamond.ct_StartPoint = self.startPoint
                myDiamond.ct_EndPoint   = self.endPoint
                myDiamond.ct_LinePath   = linePath
                myDiamond.ct_layer      = layer!
                myDiamond.drawShape()
                
            case TagCollections.shapeTag.pencil.rawValue:
                let myPencil = Pencil()
                myPencil.ct_StartPoint    = self.startPoint
                myPencil.ct_EndPoint      = self.endPoint
                currentPointArray.append(self.endPoint)
                myPencil.setPencilPoints  = currentPointArray
                myPencil.ct_LinePath      = linePath
                myPencil.ct_layer         = layer!
                myPencil.drawShape()
                
            case TagCollections.shapeTag.eraser.rawValue:
                let myEraser = Pencil()
                myEraser.ct_StartPoint    = self.startPoint
                myEraser.ct_EndPoint      = self.endPoint
                currentPointArray.append(self.endPoint)
                myEraser.setPencilPoints  = currentPointArray
                myEraser.ct_LinePath      = linePath
                myEraser.ct_layer         = layer!
                myEraser.ct_layer.fillColor = UIColor.white.cgColor
                myEraser.ct_layer.opacity = 1.0
                myEraser.ct_layer.strokeColor = UIColor.white.cgColor
                myEraser.ct_layer.lineWidth   = 20.0

                myEraser.drawShape()

            default:
                break;
            }
            
        }else if sender.state == .ended{
                currentPointArray.removeAll()
            
        }
    }
    

    @IBAction func deleteBtn(_ sender: UIButton) {
        let actionSheetDeleteController:UIAlertController =
                        UIAlertController(title: "Notice!", message: "Do you want to delete all", preferredStyle: .actionSheet)
        
        let deleteActionButton: UIAlertAction =
                        UIAlertAction(title: "Delete All", style: .default) { void in
            print("delete all")
            for mylayer in self.layerArray{
                mylayer.removeFromSuperlayer()
            }
        }
        actionSheetDeleteController.addAction(deleteActionButton)
        
        let cancelActionButton: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) {void in
        }
        actionSheetDeleteController.addAction(cancelActionButton)
        
        self.present(actionSheetDeleteController, animated: true, completion: nil)
    }
    
    @IBAction func savePicBtn(_ sender: UIButton) {
        //UIGraphicsBeginImageContext(DrawAreaView.frame.size)
        UIGraphicsBeginImageContextWithOptions(DrawAreaView.frame.size, true, 0.0)
        let ctx = UIGraphicsGetCurrentContext()!
        ctx.translateBy(x: (DrawAreaView.frame.size.width-self.view.frame.size.width), y: 0)
        view.layer.render(in: ctx)
        let img:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        UIImageWriteToSavedPhotosAlbum(img, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    func image(_ image: UIImage, didFinishSavingWithError error: NSError?, contextInfo:UnsafeRawPointer) {
        var resultTitle:String?
        var resultMessage:String?
        if error != nil {
            resultTitle = "Error"
            resultMessage = "FAilure to save, please to check the permission"
        } else {
            resultTitle = "Notice!"
            resultMessage = "Save Successfully"
        }
        let alert:UIAlertController = UIAlertController.init(title: resultTitle, message:resultMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    

    
   ////Code Area End   ////
    

}

