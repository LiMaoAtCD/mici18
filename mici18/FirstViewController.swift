//
//  FirstViewController.swift
//  mici18
//
//  Created by AlienLi on 14/12/24.
//  Copyright (c) 2014年 ALN. All rights reserved.
//

import UIKit
import Foundation


class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let sb: UIStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
    
    var mainPageItems: [AnyObject]?

    @IBOutlet weak var mainPageList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "ALNavatar", name: "ALNavatar", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "ALNguarantee", name: "ALNguarantee", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "ALNrecycleSchedule", name: "ALNrecycleSchedule", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "ALNcoupon", name: "ALNcoupon", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "ALNenshrine", name: "ALNenshrine", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "ALNcontribute", name: "ALNcontribute", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "ALNsetting", name: "ALNsetting", object: nil)
        
        
        
        
        var userDefault: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        var account = userDefault.objectForKey("ALNAccount") as String?
        
        if let acc = account {
            
        } else {
            
        }
        
        
        
        
        
        
        
        //定制左按钮
        let leftImage = UIImage(named: "button")
        let leftImageWidth = leftImage?.size.width
        let leftImageHeight = leftImage?.size.height
        let leftButton: UIButton = UIButton(frame: CGRect(x: 0,y: 0,width: leftImageWidth!, height: leftImageHeight!))
        leftButton.layer.cornerRadius = leftImageWidth! < leftImageHeight! ? leftImageWidth! / 2 : leftImageHeight! / 2
        leftButton.layer.masksToBounds = true
        
        leftButton.setBackgroundImage(leftImage, forState: .Normal)
        leftButton.addTarget(self, action: Selector("showLeftPanel:"), forControlEvents: UIControlEvents.TouchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftButton)
        
        //定制右按钮
        let infoImage = UIImage(named: "button")
        let imgWidth = infoImage?.size.width
        let imgHeight = infoImage?.size.height
        let button:UIButton = UIButton(frame: CGRect(x: 0,y: 0,width: imgWidth!, height: imgHeight!))
        button.setBackgroundImage(infoImage, forState: .Normal)
        button.addTarget(self, action: Selector("showRightPanel:"), forControlEvents: UIControlEvents.TouchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        
       
        
        
        self.title = "首页"
        
        mainPageItems = [4, 6, 2]
        
        self.mainPageList.tableFooterView = UIView()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //navigationBar 样式
        self.navigationController?.navigationBar.setBackgroundImage(nil, forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = nil
        self.navigationController?.navigationBar.translucent = false
        
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return mainPageItems!.count + 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        if indexPath.row == 0 {
            
           var cell: MainPageFirstItemCell? = tableView.dequeueReusableCellWithIdentifier("MainPageFirstItemCell") as? MainPageFirstItemCell
            
            
            if let c = cell {
            } else {
                var arr = NSBundle.mainBundle().loadNibNamed("MainPageFirstItemCell", owner: self, options: nil)
                
                cell = arr.first as? MainPageFirstItemCell
            }
            cell?.firstItemImageView.image = UIImage(named: "test")
            
            return cell!

        } else {
            return self.configureCell(indexPath, tableView: tableView)
        }
        
        
        
    }
    
    func configureCell(indexPath: NSIndexPath , tableView:UITableView) -> UITableViewCell {
        
            if mainPageItems?[indexPath.row - 1] as Int == 2 {
                
                var cell: MainPageForTwoCell? = tableView.dequeueReusableCellWithIdentifier("MainPageForTwoCell") as? MainPageForTwoCell
                
                if let c = cell {
                } else {
                    
                    var arr = NSBundle.mainBundle().loadNibNamed("MainPageForTwoCell", owner: self, options: nil)
                    cell = arr.first as? MainPageForTwoCell
                }
            
                return cell!
                
            } else if mainPageItems?[indexPath.row - 1] as Int == 4  {
                
                var cell: MainPageForFourCell? = tableView.dequeueReusableCellWithIdentifier("MainPageForFourCell") as? MainPageForFourCell
                
                if let c = cell {
                } else {
                    var arr = NSBundle.mainBundle().loadNibNamed("MainPageForFourCell", owner: self, options: nil)
                    cell = arr.first as? MainPageForFourCell
                }
                
                return cell!
                
            } else {
                
                var cell: MainPageForSixTableViewCell? = tableView.dequeueReusableCellWithIdentifier("MainPageForSixTableViewCell") as? MainPageForSixTableViewCell
                
                if let c = cell {
                } else {
                    var arr = NSBundle.mainBundle().loadNibNamed("MainPageForSixTableViewCell", owner: self, options: nil)
                    cell = arr.first as? MainPageForSixTableViewCell
                }
                
                return cell!
            }
            
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        if indexPath.row == 0 {
//            
//            var cell: MainPageFirstItemCell? = tableView.dequeueReusableCellWithIdentifier("MainPageFirstItemCell") as? MainPageFirstItemCell
//            if let c = cell {
//            } else {
//                var arr = NSBundle.mainBundle().loadNibNamed("MainPageFirstItemCell", owner: self, options: nil)
//                
//                cell = arr.first as? MainPageFirstItemCell
//            }
//            
//            var size: CGSize = cell!.contentView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize)
//            println(size)
//            return 1 + size.height
//        } else {
//           var cell =  self.configureCell(indexPath, tableView: tableView)
//            
//            var size: CGSize = cell.contentView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize)
//            
//            return size.height + 1
//        }
        if indexPath.row == 0 {
            return 199.0
        } else {
            if mainPageItems?[indexPath.row - 1] as Int == 2 {
                return 117
            } else if mainPageItems?[indexPath.row - 1] as Int == 4 {
                return 167
            } else {
                return 285
            }
        }
    }
    
    
    // MARK: Container Methods
    
    func commonSettings(vc:UIViewController) {
        self.navigationController?.popToRootViewControllerAnimated(false)
        self.navigationController?.tabBarController?.selectedIndex = 0
        
        vc.hidesBottomBarWhenPushed = true
        
        self.navigationController?.navigationBar.setBackgroundImage(nil, forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = nil
        self.navigationController?.navigationBar.translucent = false
        
       
    }
    
    func ALNavatar(){
        var avatarVC = sb.instantiateViewControllerWithIdentifier("AvatarViewController") as AvatarViewController
        commonSettings(avatarVC)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.translucent = true
        
        self.navigationController?.pushViewController(avatarVC, animated: false)
        
    }
    func ALNguarantee(){
      
        var guaranteeVC = sb.instantiateViewControllerWithIdentifier("GuaranteeViewController") as GuaranteeViewController
        commonSettings(guaranteeVC)

        self.navigationController?.pushViewController(guaranteeVC, animated: false)
        
    }
    func ALNrecycleSchedule(){
        
        var recycleVC = sb.instantiateViewControllerWithIdentifier("RecycleScheduleViewController") as RecycleScheduleViewController
        commonSettings(recycleVC)
        self.navigationController?.pushViewController(recycleVC, animated: false)
        
    }

    func ALNcoupon(){
        var couponVC = sb.instantiateViewControllerWithIdentifier("CouponViewController") as CouponViewController
        commonSettings(couponVC)
        self.navigationController?.pushViewController(couponVC, animated: false)
    }

    func ALNenshrine(){
        var enshrineVC = sb.instantiateViewControllerWithIdentifier("EnshrineViewController") as EnshrineViewController
        commonSettings(enshrineVC)
        self.navigationController?.pushViewController(enshrineVC, animated: false)
        
    }
    func ALNcontribute(){
        var ContributeVC = sb.instantiateViewControllerWithIdentifier("ContributeViewController") as ContributeViewController
        commonSettings(ContributeVC)
        self.navigationController?.pushViewController(ContributeVC, animated: false)
        
    }
    func ALNsetting(){
        var settingVC = sb.instantiateViewControllerWithIdentifier("SettingViewController") as SettingViewController
        commonSettings(settingVC)
        self.navigationController?.pushViewController(settingVC, animated: false)
        
    }

    
    
    
    
    func showLeftPanel(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("toggleLeftPanel", object: nil)
    }

    func showRightPanel(sender: AnyObject) {
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
