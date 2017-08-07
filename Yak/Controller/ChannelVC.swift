//
//  ChannelVC.swift
//  Yak
//
//  Created by George Kapoya on 2017/07/29.
//  Copyright © 2017 George Kapoya. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnMenu: UIButton!
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth  = self.view.frame.size.width - 60
        NotificationCenter.default.addObserver(self, selector: #selector(ChannelVC.userDataDidChange(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
    }

    
 
    @IBAction func btnLoginTapped(_ sender: Any) {
        
        self.performSegue(withIdentifier: SHOW_LOGIN, sender: self)
    }
    
    
    
 @objc func userDataDidChange(_ notif: Notification){
        if AuthService.instance.isLoggedIn {
            btnLogin.setTitle(UserDataService.instance.name, for: .normal)
            imgProfile.image  = UIImage(named: UserDataService.instance.avatarName)
            imgProfile.backgroundColor  = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
        }
    }

}
