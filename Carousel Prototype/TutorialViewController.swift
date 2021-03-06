//
//  TutorialViewController.swift
//  Carousel Prototype
//
//  Created by Bjørn Eivind Rostad on 9/20/14.
//  Copyright (c) 2014 Bjørn Eivind Rostad. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var backupButtonImageView: UIImageView!
    @IBOutlet weak var backupSwitch: UISwitch!
    @IBAction func onContinueButton(sender: UIButton) {
        self.performSegueWithIdentifier("continueSegue", sender: self)
    }


    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView!) {
        // Get the current page based on the scroll offset
        var page:Int = Int(round(scrollView.contentOffset.x / 320))
        
        // Set the current page, so the dots will update
        pageControl.currentPage = page
        
        
        // Set the backup button to only be visible on the last page
        if page == 3 {
            UIView.animateWithDuration(0.4) {
                self.backupButtonImageView.alpha = 1
                self.backupSwitch.alpha = 1
            }
        }
        else {
            UIView.animateWithDuration(0.4) {
                self.backupButtonImageView.alpha = 0
                self.backupSwitch.alpha = 0
            }
        }
        
        if page == 3 {
            UIView.animateWithDuration(0.2) {
                self.pageControl.alpha = 0
            }
        }
        else {
            UIView.animateWithDuration(0.2) {
                self.pageControl.alpha = 1
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSize(width: 1280, height: 568)
        scrollView.delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
