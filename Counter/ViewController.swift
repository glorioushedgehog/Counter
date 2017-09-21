//
//  ViewController.swift
//  Counter
//
//  Created by Paul Devlin on 9/14/17.
//  Copyright © 2017 Paul Devlin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!

    @IBOutlet weak var seizureLabel: UILabel!
    
    @IBOutlet weak var stepper: UIStepper!
    
    @IBOutlet weak var seizureSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        countChanged(sender: self)
    }

    @IBAction func countChanged(_ sender: Any) {
        let newCount = Int(stepper.value)
        countLabel.text = "\(newCount)"
        let redValue: CGFloat
        let greenValue: CGFloat
        let blueValue: CGFloat
        if seizureSwitch.isOn {
            redValue = CGFloat(newCount * 10 % 255) / 255
            greenValue = CGFloat(newCount * 130 % 255) / 255
            blueValue = CGFloat(newCount * 240 % 255) / 255
        } else {
            redValue = CGFloat(newCount * 2 % 255) / 255
            greenValue = CGFloat(newCount % 255) / 255
            blueValue = CGFloat(newCount % 255) / 255
        }
        let newBackgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
        let newColor = UIColor(red: 1 - redValue, green: 1 - greenValue, blue: 1 - blueValue, alpha: 1.0)
        view.backgroundColor = newBackgroundColor
        countLabel.textColor = newColor
        seizureLabel.textColor = newColor
        stepper.tintColor = newColor
        seizureSwitch.tintColor = newColor
        seizureSwitch.thumbTintColor = newColor
    }

}

	
