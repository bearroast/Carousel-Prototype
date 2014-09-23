//
//  ProfileViewController.swift
//  Carousel Prototype
//
//  Created by Bjørn Eivind Rostad on 9/21/14.
//  Copyright (c) 2014 Bjørn Eivind Rostad. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UIActionSheetDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var settingsImageView: UIImageView!
    @IBAction func onPressClose(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
   
    @IBAction func onPressSignOut(sender: UIButton) {
        var actionSheet = UIActionSheet(title: "Are you sure you want to sign out?", delegate: self, cancelButtonTitle: "Cancel", destructiveButtonTitle: "Sign Out")
        actionSheet.showInView(view)
    }
    
    func actionSheet(actionSheet: UIActionSheet!, clickedButtonAtIndex buttonIndex: Int){
        if (buttonIndex == 0){
            println("clicked 0")
            self.performSegueWithIdentifier("signOutSegue", sender: self)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentSize = settingsImageView.image!.size
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
