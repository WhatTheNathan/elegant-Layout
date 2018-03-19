//
//  AtrributedStringHelper.swift
//  Instagram
//
//  Created by Nathan on 19/03/2018.
//  Copyright © 2018 Nathan. All rights reserved.
//

import Foundation
import UIKit

fileprivate let weights = [
    UIFont.Weight.ultraLight,
    UIFont.Weight.thin,
    UIFont.Weight.light,
    UIFont.Weight.regular,
    UIFont.Weight.medium,
    UIFont.Weight.semibold,
    UIFont.Weight.bold,
    UIFont.Weight.heavy,
    UIFont.Weight.black
]

extension NSMutableAttributedString {
    func range() -> NSRange {
        return NSRange(location: 0, length: self.length)
    }
    
    @discardableResult func font(_ size: CGFloat = 14, _ weight: FontWeight = .regular, _ range: NSRange) -> Self{
        let fontAttribute = [ NSAttributedStringKey.font: UIFont.systemFont(ofSize: size, weight: weights[weight.rawValue]) ]
        self.addAttributes(fontAttribute, range: range)
        return self
    }
    
    @discardableResult func color(_ color: UIColor, _ range: NSRange) -> Self{
        let colorAttribute = [NSAttributedStringKey.foregroundColor: color]
        self.addAttributes(colorAttribute, range: range)
        return self
    }
}
