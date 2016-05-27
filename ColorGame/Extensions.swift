//
//  Extensions.swift
//  ColorGame
//
//  Created by David Seitz Jr on 5/26/16.
//  Copyright © 2016 David Seitz Jr. All rights reserved.
//

import Foundation
import UIKit

class ColorLabel: UILabel {

    override func drawTextInRect(rect: CGRect) {
        
        let shadowOffset = self.shadowOffset
        let textColor = self.textColor

        let c = UIGraphicsGetCurrentContext()
        CGContextSetLineWidth(c, 1)
        CGContextSetLineJoin(c, CGLineJoin.Round)

        CGContextSetTextDrawingMode(c, CGTextDrawingMode.Stroke)
        self.textColor = UIColor.whiteColor()
        super.drawTextInRect(rect)

        CGContextSetTextDrawingMode(c, CGTextDrawingMode.Fill)
        self.textColor = textColor
        self.shadowOffset = CGSize(width: 0, height: 0)
        super.drawTextInRect(rect)

        self.shadowOffset = shadowOffset
    }
}