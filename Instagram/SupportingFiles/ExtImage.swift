//
//  ExtImage.swift
//  Instagram
//
//  Created by Nathan on 18/03/2018.
//  Copyright © 2018 Nathan. All rights reserved.
//

import Foundation
import CoreImage
import UIKit

extension UIImage {
    func drawCircleImage() -> UIImage{
        let side = min(self.size.width,self.size.height)
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: side, height: side), false, UIScreen.main.scale)
        
        // addPath 通过贝塞尔曲线
        UIGraphicsGetCurrentContext()?.addPath(UIBezierPath.init(ovalIn: CGRect(x: 0, y: 0, width: side, height: side)).cgPath)
        // 裁剪
        UIGraphicsGetCurrentContext()?.clip()
        
        let marginX = -(self.size.width - side) * 0.5
        let marginY = -(self.size.height - side) * 0.5
        // 真正画的操作
        self.draw(in: CGRect(x: marginX, y: marginY, width: self.size.width, height: self.size.height))
        
//        UIGraphicsGetCurrentContext()?.drawPath(using: CGPathDrawingMode.fillStroke)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
}
