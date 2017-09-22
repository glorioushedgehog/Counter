//
//  ViewController.swift
//  Counter
//
//  Created by Paul Devlin on 9/14/17.
//  Copyright © 2017 Paul Devlin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // a number which will change according to the stepper
    @IBOutlet weak var countLabel: UILabel!
    // label for seizure switch
    @IBOutlet weak var seizureLabel: UILabel!
    // the stepper that changes the vlue of countLabel
    @IBOutlet weak var stepper: UIStepper!
    // allows the user to switch between normal color changing mode and seizure mode
    @IBOutlet weak var seizureSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // set initial colors
        countChanged(sender: self)
    }
    // change colors and update countLabel
    @IBAction func countChanged(_ sender: Any) {
        let newCount = Int(stepper.value)
        countLabel.text = "\(newCount)"
        let redValue: CGFloat
        let greenValue: CGFloat
        let blueValue: CGFloat
        if seizureSwitch.isOn {
            // if user has entered seizure mode, multiply count value by arbitrary numbers to produce arbitrary colors
            redValue = CGFloat(newCount * 10 % 255) / 255
            greenValue = CGFloat(newCount * 130 % 255) / 255
            blueValue = CGFloat(newCount * 240 % 255) / 255
        } else {
            // if not in seizure mode, just multiply by 2 for redValue to avoid displaying everything in a shade of grey
            // whose complement is itself
            redValue = CGFloat(newCount * 2 % 255) / 255
            greenValue = CGFloat(newCount % 255) / 255
            blueValue = CGFloat(newCount % 255) / 255
        }
        let newBackgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
        // set the color of everything besides the background to be complement of the background color
        let newColor = UIColor(red: 1 - redValue, green: 1 - greenValue, blue: 1 - blueValue, alpha: 1.0)
        view.backgroundColor = newBackgroundColor
        countLabel.textColor = newColor
        seizureLabel.textColor = newColor
        stepper.tintColor = newColor
        seizureSwitch.tintColor = newColor
        seizureSwitch.thumbTintColor = newColor
    }

}

	
