//
//  ChatVC.swift
//  Yak
//
//  Created by George Kapoya on 2017/07/29.
//  Copyright © 2017 George Kapoya. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {
    @IBOutlet weak var btnMenu: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btnMenu.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        
    }
    
}
