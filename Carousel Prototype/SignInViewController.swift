//
//  SignInViewController.swift
//  Carousel Prototype
//
//  Created by Bjørn Eivind Rostad on 9/20/14.
//  Copyright (c) 2014 Bjørn Eivind Rostad. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UIAlertViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBAction func pressBackButton(sender: UIButton) {
        navigationController!.popViewControllerAnimated(true)
    }
    
    @IBAction func pressSignInButton(sender: UIButton) {
        
        if emailTextField.text == "hi@bjornrostad.no" && passwordTextField.text == "login" {
            self.performSegueWithIdentifier("signInSegue", sender: self)
            
        } else if emailTextField.text == "" || passwordTextField.text == "" {
            var alertView = UIAlertView(title: "Email Required", message: "Please enter your email address", delegate: self, cancelButtonTitle: "OK")
            alertView.show()
            
            // after press ok, set cursor to the email or password field
        }
        else {
            var alertView = UIAlertView(title: "Incorrect", message: "Please enter correct email and password", delegate: self, cancelButtonTitle: "OK")
            alertView.show()
        }
    }
    
    func keyboardWillShow(notification:NSNotification!) {
        
        self.scrollView.contentOffset.y = 130
        
    }
    
    func keyBoardWillHide(notification:NSNotification!) {
        self.scrollView.contentOffset.y = 0
    }
    
//    func keyboardWillHide(notification:NSNotification!) {
//        var userInfo = notification.userInfo!
//        
//        // Get the keyboard height and width from the notification
//        // Size varies depending on OS, language, orientation
//        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
//        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
//        var animationDuration = durationValue.doubleValue
//        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
//        var animationCurve = curveValue.integerValue
//        
//        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions.fromRaw(UInt(animationCurve << 16))!, animations: {
//
//            self.scrollView.contentOffset.y = 140
//            
//            
//            }, completion: nil)
//        
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
