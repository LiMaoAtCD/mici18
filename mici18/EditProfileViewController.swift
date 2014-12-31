//
//  EditProfileViewController.swift
//  mici18
//
//  Created by AlienLi on 14/12/31.
//  Copyright (c) 2014年 ALN. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {

    @IBOutlet weak var nickNameLabel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.nickNameLabel.becomeFirstResponder()
    }

    @IBAction func saveProfile(sender: AnyObject) {
        

        

        
    }
    
    @IBAction func cancel(sender: AnyObject) {
        
        var device: UIDevice =  UIDevice.currentDevice()
        var systemVersion = device.systemVersion
        var iOSVersion: Float = (systemVersion as NSString).floatValue
        
        if iOSVersion > 8.0 {
            
            var alert: UIAlertController = UIAlertController(title: nil, message: "是否取消编辑", preferredStyle: UIAlertControllerStyle.Alert)
            
            var action1: UIAlertAction = UIAlertAction(title: "是", style: UIAlertActionStyle.Cancel, handler: { (action) -> Void in
                
            })
            
            var action2: UIAlertAction = UIAlertAction(title: "否", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
                
            })
            
            alert.addAction(action1)
            alert.addAction(action2)
            
            self.presentViewController(alert, animated: false, completion: { () -> Void in
                println("window")
            })
        } else {
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
