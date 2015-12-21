//
//  ViewController.swift
//  Tips
//
//  Created by Gerardo Vazquez on 12/20/15.
//  Copyright © 2015 Gerardo Vazquez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditing(sender: AnyObject) {
        //print("User edit")
        var options = [0.18, 0.20,0.22]
        let percentage = options[tipControl.selectedSegmentIndex]
        
        
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * percentage
        let billTotal = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", billTotal)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

