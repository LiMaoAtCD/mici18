//
//  AvatarViewController.swift
//  mici18
//
//  Created by AlienLi on 14/12/29.
//  Copyright (c) 2014年 ALN. All rights reserved.
//

import UIKit

class AvatarViewController: UIViewController, UIActionSheetDelegate {

    @IBOutlet weak var avatarImageView: UIImageView!
    
    let rootWindow = UIApplication.sharedApplication().delegate?.window!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
       
        
        
        var tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "editAvatar:")
        self.avatarImageView.layer.cornerRadius = 100
        self.avatarImageView.layer.masksToBounds = true
        self.avatarImageView.userInteractionEnabled = true
        self.avatarImageView.addGestureRecognizer(tapGesture)
        

        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    func editAvatar(recognizer: UITapGestureRecognizer) {
        
        var device: UIDevice =  UIDevice.currentDevice()
        var systemVersion = device.systemVersion
        var iOSVersion: Float = (systemVersion as NSString).floatValue
        
        if iOSVersion > 8.0 {
            
            var sheet: UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
            var action1: UIAlertAction = UIAlertAction(title: "更换头像", style: UIAlertActionStyle.Default, handler: { (action) -> Void in

            var sheet2 = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
                
            var action3 = UIAlertAction(title: "拍照", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
                    
            })
                
            var action4 = UIAlertAction(title: "相册", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
                    
            })
                
            var action5 = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: { (action) -> Void in
                    
            })
                
                sheet2.addAction(action3)
                sheet2.addAction(action4)
                sheet2.addAction(action5)
                
                self.rootWindow?.rootViewController?.presentViewController(sheet2, animated: true, completion:nil)
                
            })
            var action2: UIAlertAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: { (action) -> Void in
                
            })
            sheet.addAction(action1)
            sheet.addAction(action2)
            
            rootWindow?.rootViewController?.presentViewController(sheet, animated: true, completion: nil)
            
        } else {
            
//            var sheet: UIActionSheet =  UIActionSheet(title: nil, delegate: self, cancelButtonTitle: "取消", destructiveButtonTitle: "更换头像")
            var sheet: UIActionSheet =  UIActionSheet(title: nil, delegate: self, cancelButtonTitle: "取消", destructiveButtonTitle: nil, otherButtonTitles: "更换头像")
            sheet.tag = 1
            sheet.showInView(self.view)
        
        }
    }
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        
        if actionSheet.tag == 0 {
            
            if buttonIndex == 0 {
                
            } else {
                var sheet: UIActionSheet =  UIActionSheet(title: nil, delegate: self, cancelButtonTitle: "取消", destructiveButtonTitle: nil, otherButtonTitles: "相机", "拍照")
                sheet.tag = 2
                sheet.showInView(self.view)
                
            }

        } else {
            
            if buttonIndex == 0 {
            
            } else if buttonIndex == 1 {
                
            } else {
                
            }
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
