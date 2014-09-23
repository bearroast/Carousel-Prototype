//
//  CreateAccountViewController.swift
//  Carousel Prototype
//
//  Created by Bjørn Eivind Rostad on 9/21/14.
//  Copyright (c) 2014 Bjørn Eivind Rostad. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var createButtonView: UIView!
    @IBOutlet weak var firstnameTextField: UITextField!
    @IBOutlet weak var lastnameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func onAgreeTermsToggle(sender: UIButton) {
        sender.selected = !sender.selected
    }
    
    @IBAction func onBackButton(sender: UIButton) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func pressCreate(sender: UIButton) {
        var alertView = UIAlertView(title: "Creating account…", message: nil, delegate: nil, cancelButtonTitle:  nil)
        alertView.show()
        
        
        delay(2, closure: { () -> () in
            
            // Great success
            if self.firstnameTextField.text != "" || self.lastnameTextField.text != "" || self.emailTextField.text != "" || self.passwordTextField.text != "" {
                
                self.firstnameTextField.text = ""
                self.lastnameTextField.text = ""
                self.emailTextField.text = ""
                self.passwordTextField.text = ""
                
                alertView.dismissWithClickedButtonIndex(0, animated: true)
                
                self.performSegueWithIdentifier("createAccountSegue", sender: self)
            }
                
                // Failure
                else {
                    UIAlertView(title: "Oops",
                        message: "Please fill out all fields",
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
    
    func keyboardWillShow(notification: NSNotification!) {
        
        var userInfo = notification.userInfo!
        
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.15, options: UIViewAnimationOptions.fromRaw(UInt(animationCurve << 16))!, animations: {
            
            // Position when keyboard is active
            self.scrollView.contentOffset.y = 80
            self.createButtonView.center.y = 405
            }, completion: nil)
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        
        var userInfo = notification.userInfo!
        
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.15, options: UIViewAnimationOptions.fromRaw(UInt(animationCurve << 16))!, animations: {
            
            // Position when keyboard is hidden
            self.scrollView.contentOffset.y = 0
            self.createButtonView.center.y = 380+64
            }, completion: nil)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

}
