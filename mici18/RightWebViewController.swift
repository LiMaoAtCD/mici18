//
//  RightWebViewController.swift
//  mici18
//
//  Created by AlienLi on 15/1/5.
//  Copyright (c) 2015年 ALN. All rights reserved.
//

import UIKit


class RightWebViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    
    var type:Int?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
       
        
        var url: NSURL?
        if let index = type {
            switch index {
            case 1:
                url = NSURL(string : "http://www.baidu.com")

            case 2:
                url = NSURL(string: "http://www.baidu.com")

            case 3:
                url = NSURL(string: "http://www.baidu.com")
            case 4:
                url = NSURL(string: "http://www.baidu.com")
            case 5:
                url = NSURL(string: "http://www.baidu.com")
            case 6:
                url = NSURL(string: "http://www.baidu.com")
            default:
                
                url = nil
            }
            
            var request: NSURLRequest = NSURLRequest(URL: url!)
            webView.loadRequest(request)
            
        }else {
            println(" type is nil")
        }
    }
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        println("request: \(request)")
        return true
    }
     func webViewDidFinishLoad(webView: UIWebView) {
        println("did")
    }
    func webViewDidStartLoad(webView: UIWebView) {
        println("start")
        
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
