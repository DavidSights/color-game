//
//  ViewController.swift
//  ColorGame
//
//  Created by David Seitz Jr on 5/26/16.
//  Copyright © 2016 David Seitz Jr. All rights reserved.
//

import UIKit

enum GameColors: Int {

    case red
    case orange
    case yellow
    case green
    case blue
    case purple

    func color() -> UIColor {

        switch self {

        case .red:
            return UIColor.redColor()

        case .orange:
            return UIColor.orangeColor()

        case .yellow:
            return UIColor.orangeColor()

        case .green:
            return UIColor.greenColor()

        case .blue:
            return UIColor.blueColor()

        case .purple:
            return UIColor.purpleColor()
        }
    }

    /// Returns the number of existing cases for GameColors enum.
    static let count: Int = {

        var max: Int = 0

        while let _ = GameColors(rawValue: max) {
            max += 1
        }

        return max
    }()
}

class ViewController: UIViewController {

    // MARK: Properties

    var currentColorString: String?
    var tapGestureRecognizer: UITapGestureRecognizer!

    // MARK: IBOutlets

    @IBOutlet weak var colorLabel: ColorLabel!

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.userTapped))
        self.view.addGestureRecognizer(self.tapGestureRecognizer)
    }

    // MARK: - Gesture Recognizer

    func userTapped() {
        print("ViewController.userTapped(): User tapped.")
    }

    // MARK: - Convenience Methods

    private func setupUI() {

        self.colorLabel.textColor = UIColor.whiteColor()
        self.colorLabel.strokeColor = UIColor.blackColor()

        self.changeLabel(text: "RED", color: UIColor.whiteColor(), darkBackground: false)
        self.changeBackgroundColorTo(color: UIColor.redColor())
    }

    private func changeBackgroundColorTo(color color: UIColor) {
        self.view.backgroundColor = color
    }

    private func changeLabel(text text: String, color: UIColor, darkBackground: Bool) {

        self.colorLabel.text = text
        self.colorLabel.textColor = color

        if darkBackground {
            self.colorLabel.strokeColor = UIColor.whiteColor()
            self.colorLabel.updateStroke()
        } else {
            self.colorLabel.strokeColor = UIColor.blackColor()
            self.colorLabel.updateStroke()
        }
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
