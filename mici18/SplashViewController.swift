//
//  SplashViewController.swift
//  mici18
//
//  Created by AlienLi on 15/1/6.
//  Copyright (c) 2015年 ALN. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var imageView1: UIImageView = UIImageView(frame: CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height))
        var imageView2: UIImageView = UIImageView(frame: CGRectMake(self.view.bounds.width, 0, self.view.bounds.width, self.view.bounds.height))
        var imageView3: UIImageView = UIImageView(frame: CGRectMake(self.view.bounds.width * 2, 0, self.view.bounds.width, self.view.bounds.height))
        
        imageView1.image = UIImage(named: "test")
        imageView2.image = UIImage(named: "test")
        imageView3.image = UIImage(named: "test")
        
        
        var button: UIButton  = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
        
        button.addTarget(self, action: "dismissViewController:", forControlEvents: UIControlEvents.TouchUpInside)
        
        button.frame = CGRectMake(self.view.bounds.width * 2, self.view.bounds.height / 2, self.view.bounds.width , self.view.bounds.height/2)
        
        self.scrollView.addSubview(imageView1)
        self.scrollView.addSubview(imageView2)
        self.scrollView.addSubview(imageView3)
        self.scrollView.addSubview(button)

        self.scrollView.delegate = self
        self.scrollView.contentSize = CGSizeMake(self.view.bounds.width * 3, self.view.bounds.height)
        
    }
    
    func dismissViewController(button: UIButton) {
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            self.scrollView.transform = CGAffineTransformMakeScale(5.0, 5.0)
        }) { (finished) -> Void in
            if finished {
                self.dismissViewControllerAnimated(false, completion: nil)
            }
            
        }    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        println("\(scrollView.bounds.origin.x)")
        if scrollView.bounds.origin.x < self.view.bounds.width {
            self.pageControl.currentPage = 0
        } else if scrollView.bounds.origin.x >= self.view.bounds.width &&
        scrollView.bounds.origin.x < self.view.bounds.width * 2
        {
            self.pageControl.currentPage = 1
        } else {
            self.pageControl.currentPage = 2
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
