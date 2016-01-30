//
//  SettingsViewController.swift
//  Tippy
//
//  Created by Gautam Sadarangani on 12/31/15.
//  Copyright © 2015 Gautam Sadarangani. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var averageField: UITextField!
    @IBOutlet weak var goodField: UITextField!    
    @IBOutlet weak var excelField: UITextField!
    override func viewDidLoad() {
      //
       
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        let DoneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Bordered, target: self, action: "back:")
        self.navigationItem.leftBarButtonItem = DoneButton
    }
        func back(sender : UIBarButtonItem){
            
            let average = Int(averageField.text!)
            let good = Int(goodField.text!)
            let excel = Int(excelField.text!)
            print("set \(average)")
            print("set \(good)")
            print("set \(excel)")
            
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setInteger(average!, forKey: "default_average")
            defaults.setInteger(good!, forKey: "default_good")
            defaults.setInteger(excel!, forKey: "default_excel")
            defaults.synchronize()
            self.navigationController?.popViewControllerAnimated(true)
        }
        
        // Do any additional setup after loading the view.
       
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear 2")
        let defaults = NSUserDefaults.standardUserDefaults()
        let avg = defaults.integerForKey("default_average")
        let good = defaults.integerForKey("default_good")
        let excel = defaults.integerForKey("default_excel")
        
        averageField.text = "\(avg)"
        goodField.text = "\(good)"
        excelField.text = "\(excel)"

        
        // This is a good place to retrieve the default tip percentage from NSUserDefaults
        // and use it to update the tip amount
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
        //override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
          //  if (segue.identifier == "segueTest") {
            //    var svc = segue!.destinationViewController as secondViewController;
                
              //  svc.toPass = textField.text
    }
    @IBAction func OnTapClear(sender: AnyObject) {
         view.endEditing(true)
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
