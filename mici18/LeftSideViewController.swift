//
//  LeftSideViewController.swift
//  mici18
//
//  Created by AlienLi on 14/12/25.
//  Copyright (c) 2014年 ALN. All rights reserved.
//

import UIKit


enum SelectItems {
    case avatar
    case guarantee
    case recycleSchedule
    case coupon
    case enshrine
    case contribute
    case setting
}



protocol LeftViewControllerDelegate {
     func selectItem(index: SelectItems)
}

class LeftSideViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var creditsLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var delegate: LeftViewControllerDelegate?
    
    private let dataItems = [["每日保障", "回收进程查询", "电子优惠券"],
        ["我的收藏", "我要投稿"], ["设置"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.avatarImageView.layer.cornerRadius = 26
//        self.avatarImageView.layer.cornerRadius = self.avatarImageView.bounds.width < self.avatarImageView.bounds.height ? (self.avatarImageView.bounds.width / 2) : (self.avatarImageView.bounds.height / 2)
        self.avatarImageView.layer.masksToBounds = true
        self.avatarImageView.image = UIImage(named: "image1")
        
        
        var nib: UINib = UINib(nibName: "LeftSideCell", bundle: NSBundle.mainBundle())
        
        
        self.tableView.registerNib(nib, forCellReuseIdentifier: "LeftCell")
        
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        avatarImageView.userInteractionEnabled = true
        
        var tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "tapForAlterAvatar:")
        self.avatarImageView.addGestureRecognizer(tapGesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 3
        } else if section == 1 {
            return 2
        } else {
            return 1
        }
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        var leftCell: LeftSideCell = tableView.dequeueReusableCellWithIdentifier("LeftCell", forIndexPath: indexPath) as LeftSideCell
        
            leftCell.leftImageView.image = UIImage(named: "image1")
            leftCell.leftLabel.text = dataItems[indexPath.section][indexPath.row]
        
        
//        var leftCell: LeftSideCell?
//      
//            var nib = UINib(nibName: "LeftSideCell", bundle: NSBundle.mainBundle())
//            var arr = NSBundle.mainBundle().loadNibNamed("LeftSideCell", owner: self, options: nil) as [AnyObject]
//            leftCell = arr.first as? LeftSideCell
//        
//        leftCell?.leftImageView.image = UIImage(named: "image1")
//
//        return leftCell!
        
        return leftCell
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20.0
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                delegate?.selectItem(SelectItems.guarantee)
            } else if indexPath.row == 1 {
                delegate?.selectItem(SelectItems.recycleSchedule)
            } else {
                delegate?.selectItem(SelectItems.coupon)
            }
        } else if indexPath.section == 1 {
            if indexPath.row == 0 {
                delegate?.selectItem(SelectItems.enshrine)
            } else {
                delegate?.selectItem(SelectItems.contribute)
            }
        } else {
            delegate?.selectItem(SelectItems.setting)
        }
        
    }
    
    func tapForAlterAvatar(recognizer: UITapGestureRecognizer) {
        delegate?.selectItem(SelectItems.avatar)

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
