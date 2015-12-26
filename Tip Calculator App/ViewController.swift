//
//  ViewController.swift
//  Tip Calculator App
//
//  Created by Gerardo Vazquez on 12/22/15.
//  Copyright © 2015 Gerardo Vazquez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var percentLabel: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        /* NEW PERCENT */
        let defaults = NSUserDefaults.standardUserDefaults()
        var tipValue = defaults.doubleForKey("default_tip_percentage")
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipValue
        let billTotal = billAmount + tip
        /* FORMAT */
        let locale = NSLocale.currentLocale().localeIdentifier
        let universalLocale = NSLocale(localeIdentifier: locale)
        let currencyFormatter = NSNumberFormatter()
        currencyFormatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        currencyFormatter.locale = universalLocale
        /* UPDATE LABEL */
        tipLabel.text = String(currencyFormatter.stringFromNumber(tip)!)
        totalLabel.text = String(currencyFormatter.stringFromNumber(billTotal)!)
        tipValue = tipValue * 100
        percentLabel.text = String(format: "%.0f", tipValue)
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tip Calculator"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func onEditing(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        let tipValue = defaults.doubleForKey("default_tip_percentage")
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipValue
        let billTotal = billAmount + tip
        
        let locale = NSLocale.currentLocale().localeIdentifier
        let universalLocale = NSLocale(localeIdentifier: locale)
        let currencyFormatter = NSNumberFormatter()
        currencyFormatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        currencyFormatter.locale = universalLocale
        
        tipLabel.text = String(currencyFormatter.stringFromNumber(tip)!)
        totalLabel.text = String(currencyFormatter.stringFromNumber(billTotal)!)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

