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
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var imgUserBackGround: UIImageView!
    
    
    var avatarName = "profileDefault"
    var avatarColor:String!
    var bgColor:UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       self.setupView()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if UserDataService.instance.avatarName != "" {
            self.imgAvator.image  = UIImage(named: UserDataService.instance.avatarName)
        }
        
        if avatarName.contains("light") && bgColor == nil {
            imgUserBackGround.backgroundColor = UIColor.lightGray
        }
        
    }
    
    @IBAction func btnCancelTapped(_ sender: Any) {
       self.performSegue(withIdentifier: UNWIND_TO_CHANNEL, sender: self)
    }
    
    
    
    @IBAction func btnChooseAvatorTapped(_ sender: Any) {
        self.performSegue(withIdentifier: TO_AVATAR_PICKER, sender: self)
        
    }
    
    @IBAction func btnChangeBackGroundTapped(_ sender: Any) {
        let r = CGFloat(arc4random_uniform(255))  / 255
        let g = CGFloat(arc4random_uniform(255)) / 255
        let b = CGFloat(arc4random_uniform(255)) / 255
        bgColor = UIColor(red: r, green: g, blue: b, alpha: 1)
        avatarColor = "[\(r), \(g), \(b), 1]"
        self.imgUserBackGround.backgroundColor  = bgColor
        UIView.animate(withDuration: 0.2) {
            self.avatarName  = UserDataService.instance.avatarName
            
        }
        
    }
    
    
    func setupView() {
       self.spinner.isHidden = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(RegisterVC.handleTap))
        self.view.addGestureRecognizer(tap)
    }
    
    
    @objc func handleTap(){
        self.view.endEditing(true)
    }
    
    @IBAction func btnRegisterTapped(_ sender: Any) {
        self.spinner.isHidden = false
        self.spinner.startAnimating()
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
                                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                                self.spinner.isHidden = true
                                self.spinner.stopAnimating()
                            }
                        })
                    }
                    
                })
            }
        })
    }
}
