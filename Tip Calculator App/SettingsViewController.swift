//
//  SettingsViewController.swift
//  Tip Calculator App
//
//  Created by Gerardo Vazquez on 12/23/15.
//  Copyright © 2015 Gerardo Vazquez. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var percentSlider: UISlider!
    @IBOutlet weak var numLabel: UILabel!
    
    var tipValue: Double = 0
    var temp: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"
        
        let defaults = NSUserDefaults.standardUserDefaults()
        tipValue = defaults.doubleForKey("default_tip_percentage")
        tipValue = tipValue*100
        
        percentSlider.value = Float(tipValue)
        let num = "\(Int(percentSlider.value))" + "%"
        numLabel.text = num
    }
    
    @IBAction func onChange(sender: AnyObject) {
        let num = "\(Int(percentSlider.value))" + "%"
        numLabel.text = num
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func onTap(sender: AnyObject) {
        //view.endEditing(true)
    }

    override func viewWillDisappear(animated: Bool){
        super.viewWillDisappear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        tipValue = Double(percentSlider.value)/100
        defaults.setDouble(tipValue, forKey: "default_tip_percentage")
        defaults.synchronize()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
