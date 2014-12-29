//
//  LeftSideViewController.swift
//  mici18
//
//  Created by AlienLi on 14/12/25.
//  Copyright (c) 2014年 ALN. All rights reserved.
//

import UIKit

class LeftSideViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var creditsLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
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
        
        return leftCell
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20.0
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
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
