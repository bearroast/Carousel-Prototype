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
    
    
    @IBAction func onBackButton(sender: UIButton) {  navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func pressCreate(sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

}
