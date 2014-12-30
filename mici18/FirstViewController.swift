//
//  FirstViewController.swift
//  mici18
//
//  Created by AlienLi on 14/12/24.
//  Copyright (c) 2014年 ALN. All rights reserved.
//

import UIKit



class FirstViewController: UIViewController {
    
    let sb: UIStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //           case avatar
//        case guarantee
//        case recycleSchedule
//        case coupon
//        case enshrine
//        case contribute
//        case setting
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "ALNavatar", name: "ALNavatar", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "ALNguarantee", name: "ALNguarantee", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "ALNrecycleSchedule", name: "ALNrecycleSchedule", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "ALNcoupon", name: "ALNcoupon", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "ALNenshrine", name: "ALNenshrine", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "ALNcontribute", name: "ALNcontribute", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "ALNsetting", name: "ALNsetting", object: nil)
        
    }
    
    
    
    func ALNavatar(){
        self.navigationController?.tabBarController?.selectedIndex = 0
        var avatarVC = sb.instantiateViewControllerWithIdentifier("AvatarViewController") as AvatarViewController
        avatarVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(avatarVC, animated: false)
        
    }
    func ALNguarantee(){
        self.navigationController?.tabBarController?.selectedIndex = 0
        var guaranteeVC = sb.instantiateViewControllerWithIdentifier("GuaranteeViewController") as GuaranteeViewController
        
        self.navigationController?.pushViewController(guaranteeVC, animated: false)
        
    }
    func ALNrecycleSchedule(){
        self.navigationController?.tabBarController?.selectedIndex = 0
        var recycleVC = sb.instantiateViewControllerWithIdentifier("RecycleScheduleViewController") as RecycleScheduleViewController
        
        self.navigationController?.pushViewController(recycleVC, animated: false)
        
    }

    func ALNcoupon(){
        self.navigationController?.tabBarController?.selectedIndex = 0
        var couponVC = sb.instantiateViewControllerWithIdentifier("CouponViewController") as CouponViewController
        
        self.navigationController?.pushViewController(couponVC, animated: false)
    }

    func ALNenshrine(){
        self.navigationController?.tabBarController?.selectedIndex = 0
        var enshrineVC = sb.instantiateViewControllerWithIdentifier("EnshrineViewController") as EnshrineViewController
        
        self.navigationController?.pushViewController(enshrineVC, animated: false)
        
    }
    func ALNcontribute(){
        self.navigationController?.tabBarController?.selectedIndex = 0
        var ContributeVC = sb.instantiateViewControllerWithIdentifier("ContributeViewController") as ContributeViewController
        
        self.navigationController?.pushViewController(ContributeVC, animated: false)
        
    }
    func ALNsetting(){
        self.navigationController?.tabBarController?.selectedIndex = 0
        var settingVC = sb.instantiateViewControllerWithIdentifier("SettingViewController") as SettingViewController
        
        self.navigationController?.pushViewController(settingVC, animated: false)
        
    }

    
    
    
    
    @IBAction func showLeftPanel(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("toggleLeftPanel", object: nil)
    }

    @IBAction func showRightPanel(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("toggleRightPanel", object: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
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
