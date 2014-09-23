//
//  TermsViewController.swift
//  Carousel Prototype
//
//  Created by Bjørn Eivind Rostad on 9/22/14.
//  Copyright (c) 2014 Bjørn Eivind Rostad. All rights reserved.
//

import UIKit

class TermsViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var webView: UIWebView!
    @IBAction func onCloseButton(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewDidLoad() {
        var url = NSURL(string:"https://www.dropbox.com/terms?mobile=1");
        var req = NSURLRequest(URL:url);
        webView.loadRequest(req);
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
