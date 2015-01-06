//
//  SecondTableTableViewController.swift
//  mici18
//
//  Created by AlienLi on 15/1/5.
//  Copyright (c) 2015年 ALN. All rights reserved.
//

import UIKit

class SecondTableTableViewController: UITableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 3
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 1
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
//        let cell = tableView.dequeueReusableCellWithIdentifier("testTableViewCell", forIndexPath: indexPath) as testTableViewCell
//
//        // Configure the cell...
//        
//        return cell
        
        if indexPath.section == 0 {
            
            let cell = tableView.dequeueReusableCellWithIdentifier("testTableViewCell", forIndexPath: indexPath) as testTableViewCell
            
//            cell.exchangeCodeTextField.delegate = self
            cell.getGiftButton.addTarget(self, action: "getGift:", forControlEvents: UIControlEvents.TouchUpInside)
            
            return cell
            
        } else  if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCellWithIdentifier("InsuranceIconTableViewCell", forIndexPath: indexPath) as InsuranceIconTableViewCell
            
            var contentView: UIView = UIView(frame: CGRectMake(0, 0, 500, 90))
            contentView.backgroundColor = UIColor.redColor()
        
            cell.scrollView.addSubview(contentView)
            cell.scrollView.contentSize = CGSizeMake(500, 90)
            
            
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("myinsuranceCell", forIndexPath: indexPath) as UITableViewCell
            return cell
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 191
        } else if indexPath.section == 1 {
            return 195 + 1
        } else {
            return 52
        }
    }
    


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
