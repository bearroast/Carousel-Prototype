//
//  SignInViewController.swift
//  Carousel Prototype
//
//  Created by Bjørn Eivind Rostad on 9/20/14.
//  Copyright (c) 2014 Bjørn Eivind Rostad. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButtonView: UIImageView!

    @IBAction func onBackButton(sender: UIButton) {
        navigationController?.popViewControllerAnimated(true)
    }
    @IBAction func onTap(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }

    
    

    @IBAction func signInButton(sender: UIButton) {
        var alertView = UIAlertView(title: "Signing in…", message: nil, delegate: nil, cancelButtonTitle:  nil)
        alertView.show()
        
        
        delay(2, closure: { () -> () in
            
            // Great success
            if self.emailTextField.text == "hi" && self.passwordTextField.text == "login" {
                
                self.emailTextField.text = ""
                self.passwordTextField.text = ""
                
                alertView.dismissWithClickedButtonIndex(0, animated: true)
                
                self.performSegueWithIdentifier("signInSegue", sender: self)
                
            // Failure
            } else if self.emailTextField.text == "" {
                UIAlertView(title: "Email Required",
                    message: "Please enter your email address",
                    delegate: self,
                    cancelButtonTitle: "OK").show()
                
                alertView.dismissWithClickedButtonIndex(0, animated: true)
                
            } else if self.passwordTextField.text == "" {
                UIAlertView(title: "Password Required",
                    message: "Please enter your password",
                    delegate: self,
                    cancelButtonTitle: "OK").show()
                
                alertView.dismissWithClickedButtonIndex(0, animated: true)
            }
                
            else {
                UIAlertView(title: "Incorrect",
                    message: "Please enter correct email and password",
                    delegate: self,
                    cancelButtonTitle: "OK").show()
                
                alertView.dismissWithClickedButtonIndex(0, animated: true)
            }

        })
        
    }
    
    
    // Simulating network delay
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    
}
