//
//  SignInViewController.swift
//  Carousel Prototype
//
//  Created by Bjørn Eivind Rostad on 9/20/14.
//  Copyright (c) 2014 Bjørn Eivind Rostad. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UIAlertViewDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBAction func pressBackButton(sender: UIButton) {
        navigationController!.popViewControllerAnimated(true)
    }
    
    @IBAction func pressSignInButton(sender: UIButton) {
        if emailTextField.text == "hi@bjornrostad.no" && passwordTextField.text == "login" {
            
        } else if emailTextField.text == "" || passwordTextField.text == "" {
            var alertView = UIAlertView(title: "Email Required", message: "Please enter your email address", delegate: self, cancelButtonTitle: "OK")
            alertView.show()
            
            // after press ok, set cursor to the email or password field
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
