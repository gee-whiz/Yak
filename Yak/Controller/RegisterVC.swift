//
//  RegisterVC.swift
//  Yak
//
//  Created by George Kapoya on 2017/07/29.
//  Copyright © 2017 George Kapoya. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {

    @IBOutlet weak var imgAvator: UIImageView!
    @IBOutlet weak var edtPassword: FloatingTextField!
    @IBOutlet weak var edtEmail: FloatingTextField!
    @IBOutlet weak var edtUserName: FloatingTextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    
    @IBAction func btnCancelTapped(_ sender: Any) {
       self.performSegue(withIdentifier: UNWIND_TO_CHANNEL, sender: self)
    }
    
    
    
    @IBAction func btnChooseAvatorTapped(_ sender: Any) {
    }
    @IBAction func btnChangeBackGroundTapped(_ sender: Any) {
    }
    
    @IBAction func btnRegisterTapped(_ sender: Any) {
    }
}
