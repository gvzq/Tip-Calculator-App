//
//  SettingsViewController.swift
//  Tip Calculator App
//
//  Created by Gerardo Vazquez on 12/23/15.
//  Copyright © 2015 Gerardo Vazquez. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var customField: UITextField!
    @IBOutlet weak var percentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = UIColor.darkGrayColor()
    }
    
    @IBAction func onEdit(sender: AnyObject) {
        //print("click control")
//        let options = [0.0, 0.18, 0.20,0.22, 100]
//        let percentage = options[percentControl.selectedSegmentIndex]
//        
//        if (percentage == 100){
//            let billAmount = NSString(string: customField.text!).doubleValue
//            let defaults = NSUserDefaults.standardUserDefaults()
//            defaults.setDouble((billAmount)/100, forKey: "default_tip_percentage")
//            defaults.synchronize()
//        }
//        else{
//            let defaults = NSUserDefaults.standardUserDefaults()
//            defaults.setDouble(percentage, forKey: "default_tip_percentage")
//        }
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        let options = [0.0, 0.18, 0.20,0.22, 100]
        let percentage = options[percentControl.selectedSegmentIndex]
        
        if (percentage == 100){
            let billAmount = NSString(string: customField.text!).doubleValue
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setDouble((billAmount)/100, forKey: "default_tip_percentage")
            defaults.synchronize()
        }
        else{
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setDouble(percentage, forKey: "default_tip_percentage")
        }
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
