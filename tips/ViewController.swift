//
//  ViewController.swift
//  tips
//
//  Created by Lam Do on 10/31/15.
//  Copyright © 2015 Lam Do. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View did load")
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "0.00"
        tipControl.selectedSegmentIndex = 1
        
        var defaults = NSUserDefaults.standardUserDefaults()
        if var index = defaults.stringForKey("IndexOfTipController") {
            var tipControlIndex = defaults.integerForKey("IndexOfTipController")
            tipControl.selectedSegmentIndex = tipControlIndex
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = NSString(string: billField.text!).doubleValue
        if billAmount > 99999 {
            //Create the AlertController
            let actionSheetController: UIAlertController = UIAlertController(title: "Alert", message: "Too much money!!", preferredStyle: .Alert)
            
            //Create and add the Cancel action
            let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
                //Do some stuff
            }
            actionSheetController.addAction(cancelAction)
            
            //Present the AlertController
            self.presentViewController(actionSheetController, animated: true, completion: nil)

        }
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }

//    @IBAction func onTap(sender: AnyObject) {
//        view.endEditing(true)
//    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("View will appear")
        var defaults = NSUserDefaults.standardUserDefaults()
        if var index = defaults.stringForKey("IndexOfTipController") {
            var tipControlIndex = defaults.integerForKey("IndexOfTipController")
            tipControl.selectedSegmentIndex = tipControlIndex
        }
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = NSString(string: billField.text!).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)

    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("View did appear")
        billField.becomeFirstResponder()
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("View will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("View did disappear")
    }
}

