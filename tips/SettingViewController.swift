//
//  SettingViewController.swift
//  tips
//
//  Created by Lam Do on 11/1/15.
//  Copyright © 2015 Lam Do. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    
    @IBOutlet weak var tipControlv2: UISegmentedControl!
    
    override func viewDidLoad() {
        // Do any additional setup after loading the view.
        var defaults = NSUserDefaults.standardUserDefaults()
        if var index = defaults.stringForKey("IndexOfTipController") {
            var tipControlIndex = defaults.integerForKey("IndexOfTipController")
            tipControlv2.selectedSegmentIndex = tipControlIndex
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onValueChanged(sender: AnyObject) {
        var tipControlv2Index = tipControlv2.selectedSegmentIndex
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(tipControlv2Index, forKey: "IndexOfTipController")
        
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
