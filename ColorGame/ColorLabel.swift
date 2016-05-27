//
//  ColorLabel.swift
//  ColorGame
//
//  Created by David Seitz Jr on 5/26/16.
//  Copyright © 2016 David Seitz Jr. All rights reserved.
//

import Foundation
import UIKit

class ColorLabel: UILabel {

    var strokeThickness: CGFloat = 8
    var strokeColor = UIColor.whiteColor()

    override func drawTextInRect(rect: CGRect) {
        
        let shadowOffset = self.shadowOffset
        let textColor = self.textColor

        let c = UIGraphicsGetCurrentContext()
        CGContextSetLineWidth(c, self.strokeThickness)
        CGContextSetLineJoin(c, CGLineJoin.Round)

        CGContextSetTextDrawingMode(c, CGTextDrawingMode.Stroke)
        self.textColor = self.strokeColor
        super.drawTextInRect(rect)

        CGContextSetTextDrawingMode(c, CGTextDrawingMode.Fill)
        self.textColor = textColor
        self.shadowOffset = CGSize(width: 0, height: 0)
        super.drawTextInRect(rect)

        self.shadowOffset = shadowOffset
    }

    func updateStroke() {
        self.drawTextInRect(self.frame)
    }
}