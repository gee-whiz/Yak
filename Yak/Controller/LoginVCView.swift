//
//  LoginVCViewController.swift
//  Yak
//
//  Created by George Kapoya on 2017/07/29.
//  Copyright © 2017 George Kapoya. All rights reserved.
//

import UIKit


class LoginVC: UIViewController {

    @IBOutlet weak var edtEmail: FloatingTextField!
    
    @IBOutlet weak var edtPassword: FloatingTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    @IBAction func btnCancelTapped(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func btnRegisterTapped(_ sender: Any) {
        self.performSegue(withIdentifier: SHOW_REGISTER, sender: self)
    }
    
    
    @IBAction func btnLogin(_ sender: Any) {
    }
    
}
