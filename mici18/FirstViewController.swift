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
    
    let userDefault: NSUserDefaults = NSUserDefaults.standardUserDefaults()

    var mainPageItems: [AnyObject]?
    

    @IBOutlet weak var mainPageList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        self.registerNotifications()
        
        
        let isLaunched = userDefault.boolForKey("ALNIsLaunched")
        
        if !isLaunched {
            userDefault.setBool(true, forKey: "ALNIsLaunched")
            userDefault.synchronize()
        
            let window = UIApplication.sharedApplication().delegate?.window!
            
            let splashVC = sb.instantiateViewControllerWithIdentifier("SplashViewController") as? SplashViewController
            
            if let splash = splashVC {
                window?.rootViewController?.presentViewController(splash, animated: false, completion: nil)
            } else {
                println("splash is fucked")
            }
            
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
        
        
        self.mainPageList.tableFooterView = UIView()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //navigationBar 样式
        self.navigationController?.navigationBar.setBackgroundImage(nil, forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = nil
        self.navigationController?.navigationBar.translucent = false
        
        //
        var account = userDefault.objectForKey("ALNAccount") as String?
        
        if let acc = account {
            
            //已有账号登录
        } else {
            //没有
            
        }
        
//        mainPageItems = [
//            [
//                ["http://www.image.com","http://www.click.com"],
//                ["http://www.image.com","http://www.click.com"]
//            ],
//            [
//                ["http://www.image.com","http://www.click.com"],
//                ["http://www.image.com","http://www.click.com"],
//                ["http://www.image.com","http://www.click.com"],
//                ["http://www.image.com","http://www.click.com"]
//            ],
//            [
//                ["http://www.image.com","http://www.click.com"],
//                ["http://www.image.com","http://www.click.com"],
//                ["http://www.image.com","http://www.click.com"],
//                ["http://www.image.com","http://www.click.com"],
//                ["http://www.image.com","http://www.click.com"],
//                ["http://www.image.com","http://www.click.com"]
//                
//            ]
//            
//        ]
        


        
    }
    
    // MARK: tableView dataSource & delegate
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let items = mainPageItems {
            return items.count + 1
        }else {
            return 0
        }
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
        
        var arr = mainPageItems?[indexPath.row - 1] as [AnyObject]
        
            if arr.count as Int == 2 {
                
                var cell: MainPageForTwoCell? = tableView.dequeueReusableCellWithIdentifier("MainPageForTwoCell") as? MainPageForTwoCell
                
                if let c = cell {
                } else {
                    
                    var arr = NSBundle.mainBundle().loadNibNamed("MainPageForTwoCell", owner: self, options: nil)
                    cell = arr.first as? MainPageForTwoCell
                    
                    cell?.imageView1.tag = indexPath.row * 1 + 0
                    cell?.imageView2.tag = indexPath.row * 1 + 1
                }
            
                return cell!
                
            } else if arr.count as Int == 4  {
                
                var cell: MainPageForFourCell? = tableView.dequeueReusableCellWithIdentifier("MainPageForFourCell") as? MainPageForFourCell
                
                if let c = cell {
                } else {
                    var arr = NSBundle.mainBundle().loadNibNamed("MainPageForFourCell", owner: self, options: nil)
                    cell = arr.first as? MainPageForFourCell
                    cell?.imageView1.tag = indexPath.row * 10 + 0
                    cell?.imageView2.tag = indexPath.row * 10 + 1
                    cell?.imageView3.tag = indexPath.row * 10 + 2
                    cell?.imageView4.tag = indexPath.row * 10 + 3
                    
                }
                
                return cell!
                
            } else {
                
                var cell: MainPageForSixTableViewCell? = tableView.dequeueReusableCellWithIdentifier("MainPageForSixTableViewCell") as? MainPageForSixTableViewCell
                
                if let c = cell {
                } else {
                    var arr = NSBundle.mainBundle().loadNibNamed("MainPageForSixTableViewCell", owner: self, options: nil)
                    cell = arr.first as? MainPageForSixTableViewCell
                    
                    cell?.imageView1.tag = indexPath.row * 20 + 0
                    cell?.imageView2.tag = indexPath.row * 20 + 1
                    cell?.imageView3.tag = indexPath.row * 20 + 2
                    cell?.imageView4.tag = indexPath.row * 20 + 3
                    cell?.imageView5.tag = indexPath.row * 20 + 4
                    cell?.imageView6.tag = indexPath.row * 20 + 5
              
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
//            
//           var cell =  self.configureCell(indexPath, tableView: tableView)
//            
//            var size: CGSize = cell.contentView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize)
//            
//            return size.height + 1
//        }
        
        if indexPath.row == 0 {
            return 199.0
        } else {
            
            var arr = mainPageItems?[indexPath.row - 1] as [AnyObject]
            
            if arr.count as Int == 2 {
                return 117
            } else if arr.count as Int == 4 {
                return 167
            } else {
                return 285
            }
        }
    }
    
    // MARK:  SidePanel
    
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
    
    // MARK: Notifications
    
    func registerNotifications(){
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "ALNavatar", name: "ALNavatar", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "ALNguarantee", name: "ALNguarantee", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "ALNrecycleSchedule", name: "ALNrecycleSchedule", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "ALNcoupon", name: "ALNcoupon", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "ALNenshrine", name: "ALNenshrine", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "ALNcontribute", name: "ALNcontribute", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "ALNsetting", name: "ALNsetting", object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "ALNincrement", name: "ALNincrement", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "ALNperipheral", name: "ALNperipheral", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "ALNmarket", name: "ALNmarket", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "ALNlifeService", name: "ALNlifeService", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "ALNbeautifulApp", name: "ALNbeautifulApp", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "ALNtipsCollection", name: "ALNtipsCollection", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "ALNLogin", name: "ALNLogin", object: nil)
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
    
    func ALNLogin() {
        var loginVC = sb.instantiateViewControllerWithIdentifier("LoginViewController") as LoginViewController
        commonSettings(loginVC)
        self.navigationController?.pushViewController(loginVC, animated: false)
    }
    
    
    
    func ALNincrement(){
        
        rightSetting(1)
        
    }
    
    func ALNperipheral() {
        
        rightSetting(2)
    }
    func ALNmarket(){
        rightSetting(3)
    }
    
    
    func ALNlifeService() {
        rightSetting(4)
    }
    
    func ALNbeautifulApp(){
        rightSetting(5)
    }
    func ALNtipsCollection(){
        rightSetting(6)
    }
    
    func rightSetting(type: Int) {
        
        var VC = sb.instantiateViewControllerWithIdentifier("RightWebViewController") as RightWebViewController
        VC.type = type
        commonSettings(VC)
        self.navigationController?.pushViewController(VC, animated: false)
        
    }
    
    
    
    
    
    


}



