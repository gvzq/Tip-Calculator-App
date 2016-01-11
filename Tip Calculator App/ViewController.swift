//
//  ViewController.swift
//  Tip Calculator App
//
//  Created by Gerardo Vazquez on 12/22/15.
//  Copyright © 2015 Gerardo Vazquez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipPercentLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var twoLabel: UILabel!
    var wasEmpty: Bool = true
    var tipValue: Double = 0
    @IBOutlet weak var d: UILabel!
    @IBOutlet weak var twoTotal: UILabel!
    @IBOutlet weak var threeTotal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tip Calculator"
        tipLabel.alpha                      = 0
        totalLabel.alpha                    = 0
        totalAmountLabel.alpha              = 0
        tipControl.alpha                    = 0
        tipPercentLabel.alpha               = 0
        d.alpha                             = 0
        twoLabel.alpha                      = 0
        twoTotal.alpha                      = 0
        threeTotal.alpha                    = 0
        billField.frame = CGRectOffset(billField.frame, 0, 120)
        billField.becomeFirstResponder()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //TIP SEGMENT CONTROL
        let defaults = NSUserDefaults.standardUserDefaults()
        tipValue = defaults.doubleForKey("default_tip_percentage")
        if (tipValue == 0.15) {
            tipControl.selectedSegmentIndex = 0
        }
        else if (tipValue == 0.18){
            tipControl.selectedSegmentIndex = 1
        }
        else if (tipValue == 0.20) {
            tipControl.selectedSegmentIndex = 2
        }
        else {
            let percent = "%"
            let val = String(Int(tipValue*100)) + percent
            tipControl.setTitle(String(val), forSegmentAtIndex: 3)
            tipControl.selectedSegmentIndex = 3
        }

        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipValue
        let billTotal = billAmount + tip
        
        let currency = NSNumberFormatter()
        currency.locale = NSLocale.currentLocale()
        currency.maximumFractionDigits = 2
        currency.minimumFractionDigits = 2
        currency.alwaysShowsDecimalSeparator = true
        currency.numberStyle = .CurrencyStyle
        
        tipLabel.text = String(currency.stringFromNumber(tip)!)
        totalLabel.text = String(currency.stringFromNumber(billTotal)!)
    }

    override func viewWillDisappear(animated: Bool)
    {
        super.viewWillDisappear(animated)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(tipValue, forKey: "default_tip_percentage")
        defaults.synchronize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func onEditing(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if (tipControl.selectedSegmentIndex == 3) {
            tipValue = defaults.doubleForKey("default_tip_percentage")
        }
        else{
            let percentages = [0.15, 0.18, 0.20]
            tipValue = percentages[tipControl.selectedSegmentIndex]
        }
        
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipValue
        let billTotal = billAmount + tip
        
        let currency = NSNumberFormatter()
        currency.locale = NSLocale.currentLocale()
        currency.maximumFractionDigits = 2
        currency.minimumFractionDigits = 2
        currency.alwaysShowsDecimalSeparator = true
        currency.numberStyle = .CurrencyStyle
        
        tipLabel.text = String(currency.stringFromNumber(tip)!)
        totalLabel.text = String(currency.stringFromNumber(billTotal)!)
        twoLabel.text = String(currency.stringFromNumber(billTotal/2)!)
        d.text = String(currency.stringFromNumber(billTotal/3)!)
        
        if billField.hasText() && wasEmpty
        {
            UIView.animateWithDuration(0.6, animations: {
                self.tipLabel.alpha         = 1
                self.totalLabel.alpha       = 1
                self.tipLabel.alpha         = 1
                self.totalAmountLabel.alpha = 1
                self.tipControl.alpha       = 1
                self.tipPercentLabel.alpha  = 1
                self.d.alpha                = 1
                self.twoLabel.alpha         = 1
                self.twoTotal.alpha         = 1
                self.threeTotal.alpha       = 1
            })
            
            UIView.animateWithDuration(0.2, animations: {
                self.billField.frame = CGRectOffset(self.billField.frame, 0, -120)
            })
            wasEmpty = false
            
        }
        else if !(billField.hasText() || wasEmpty)      // DeMorgan of !hasText && !wasEmpty
        {
            UIView.animateWithDuration(0.6, animations: {
                self.tipLabel.alpha             = 0
                self.totalLabel.alpha           = 0
                self.tipLabel.alpha             = 0
                self.totalAmountLabel.alpha     = 0
                self.tipControl.alpha           = 0
                self.tipPercentLabel.alpha      = 0
                self.d.alpha                    = 0
                self.twoLabel.alpha             = 0
                self.twoTotal.alpha             = 0
                self.threeTotal.alpha           = 0
            })
            
            UIView.animateWithDuration(0.2, delay: 0.3, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
                self.billField.frame = CGRectOffset(self.billField.frame, 0, 120)
                }, completion: nil)
            wasEmpty = true
        }
        
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

