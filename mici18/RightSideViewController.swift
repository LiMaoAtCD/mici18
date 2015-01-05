//
//  RightSideViewController.swift
//  mici18
//
//  Created by AlienLi on 14/12/25.
//  Copyright (c) 2014年 ALN. All rights reserved.
//

import UIKit



class RightSideViewController: UIViewController {

    
    @IBOutlet var RightItems: [UIView]!
    
    var delegate: SideViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        for i in RightItems {
            
            var tapRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "handleRightItemsClicks:")
            
            
            i.addGestureRecognizer(tapRecognizer)
        }
        
    }
    func handleRightItemsClicks(recognizer: UITapGestureRecognizer) {
    
//        let sb = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
//        
//        var rightWebVC = sb.instantiateViewControllerWithIdentifier("RightWebViewController") as? RightWebViewController
        
        switch recognizer.view!.tag {
        case 1:
            println("1")
            delegate?.selectItem(SelectItems.increment)

        case 2:
            println("2")
            delegate?.selectItem(SelectItems.peripheral)
        case 3:
            println("3")
            delegate?.selectItem(SelectItems.market)
        case 4:
            println("4")
            delegate?.selectItem(SelectItems.lifeService)
        case 5:
            println("5")
            delegate?.selectItem(SelectItems.beautifulApp)
        case 6:
            println("6")
            delegate?.selectItem(SelectItems.tipsCollection)
        default:
        println("no")
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
