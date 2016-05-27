//
//  ViewController.swift
//  ColorGame
//
//  Created by David Seitz Jr on 5/26/16.
//  Copyright © 2016 David Seitz Jr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentColorString: String?

    @IBOutlet weak var colorLabel: ColorLabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }

    private func setupUI() {

        self.colorLabel.textColor = UIColor.whiteColor()
        self.colorLabel.strokeColor = UIColor.blackColor()
        self.colorLabel.strokeWidth = 8

        self.colorLabel.text = "WHITE"
    }

    private func playerWon() {
        self.colorLabelDefault()
        self.colorLabel.text = "YOU WIN!"
    }

    private func playerLost() {
        self.colorLabelDefault()
        self.colorLabel.text = "YOU LOSE"
    }

    private func colorLabelDefault() {
        self.colorLabel.textColor = UIColor.whiteColor()
        self.colorLabel.strokeColor = UIColor.blackColor()
    }
}
