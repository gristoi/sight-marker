//
//  TrangleView.swift
//  sight-marker
//
//  Created by Ian Gristock on 22/11/2016.
//  Copyright © 2016 Ian Gristock. All rights reserved.
//

import UIKit
@IBDesignable
class TriangleView: UIView {
    
    override func draw(_ rect: CGRect) {
        
        // Get Height and Width
        let layerHeight = layer.frame.height
        let layerWidth = layer.frame.width
        
        // Create Path
        let bezierPath = UIBezierPath()
        
        // Draw Points
        bezierPath.move(to: CGPoint(x: 0, y: layerHeight))
        bezierPath.addLine(to: CGPoint(x: 0, y: 0))
        bezierPath.addLine(to: CGPoint(x: layerWidth , y: layerHeight))
        bezierPath.addLine(to: CGPoint(x: 0, y: layerHeight))
        bezierPath.close()
        
        // Apply Color
        UIColor(red: 1/255, green: 4/255, blue: 62/255, alpha: 1).setFill()
        bezierPath.fill()
        
        // Mask to Path
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = bezierPath.cgPath
        layer.mask = shapeLayer
    }
}
