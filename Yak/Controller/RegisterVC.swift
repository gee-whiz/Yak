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
    
    
    var avatarName = "profileDefault"
    var avatarColor = "hexValue"
    
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
        guard let emailText = edtEmail.text, edtEmail.text != "" else {return
        }
        guard let passwordText = edtPassword.text, edtPassword.text != "" else {return
        }
        guard let usernameText = edtUserName.text, edtUserName.text != "" else {return}
        AuthService.instance.registerUser(email: emailText, password: passwordText,completion: {(success) in
            if success {
                 print("success A")
                AuthService.instance.loginUser(email: emailText, password: passwordText,completion: {(success) in
                    if success {
                        print("success B")
                        AuthService.instance.createUser(name: usernameText, email: emailText, avatarName: self.avatarName, avatarColor: self.avatarColor,completion:  {(success) in
                             if success {
                                print("Avator Name ", UserDataService.instance.avatarName)
                                print("name ", UserDataService.instance.name)
                                self.performSegue(withIdentifier: UNWIND_TO_CHANNEL, sender: self)
                            }
                        })
                    }
                    
                })
            }
        })
    }
}
