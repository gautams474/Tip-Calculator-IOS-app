//
//  ViewController.swift
//  Tippy
//
//  Created by Gautam Sadarangani on 12/30/15.
//  Copyright © 2015 Gautam Sadarangani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var payLabel: UILabel!
    @IBOutlet weak var tipNameLabel: UILabel!

    @IBOutlet weak var payNameLabel: UILabel!
    @IBOutlet weak var sharesLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var tipRadio: UISegmentedControl!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    var avg : Int!, good : Int!, excel : Int!
    override func viewDidLoad() {
        
        self.view.backgroundColor = UIColor(red: 0, green: 100, blue: 200, alpha: 1.0)
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        stepper.minimumValue = 1
        stepper.maximumValue = 10
            }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear 1")
        let defaults = NSUserDefaults.standardUserDefaults()
        avg = defaults.integerForKey("default_average")
        good = defaults.integerForKey("default_good")
        excel = defaults.integerForKey("default_excel")
        print("get \(avg)")
        print("get \(good)")
        print("get \(excel)")
        tipRadio.setTitle("\(avg)", forSegmentAtIndex: 0)
        tipRadio.setTitle("\(good)", forSegmentAtIndex: 1)
        tipRadio.setTitle("\(excel)", forSegmentAtIndex: 2)
        

        // This is a good place to retrieve the default tip percentage from NSUserDefaults
        // and use it to update the tip amount
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }


    @IBAction func Oneditingchange(sender: AnyObject) {
        let shares = Int(stepper.value)
        sharesLabel.text = "\(shares)"
        if stepper.value > 1{
            tipNameLabel.text = "Tip / person"
            payNameLabel.text = "Pay / person"
        }
        else{
            tipNameLabel.text = "Tip"
            payNameLabel.text = "pay"
        }
        let billAmount = NSString(string: billField.text!).doubleValue
    
      
        
        let percents = [Double(avg)/100.0,Double(good)/100.0,Double(excel)/100.0]
        let percent = percents[tipRadio.selectedSegmentIndex]
        let tip = (billAmount*percent)/Double(shares)
        let pay = billAmount/Double(shares) + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        payLabel.text = String(format: "$%.2f", pay)
        
    }
   
    @IBAction func OnTapClear(sender: AnyObject) {
        view.endEditing(true)
    }
}

