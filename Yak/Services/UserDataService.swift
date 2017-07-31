//
//  UserDataService.swift
//  Yak
//
//  Created by George Kapoya on 2017/07/31.
//  Copyright © 2017 George Kapoya. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON



class UserDataService {
    
    
 static let instance = UserDataService()
 public private(set) var id = ""
 public private(set) var avatarColor = ""
 public private(set) var avatarName = ""
 public private(set) var name = ""
 public private(set) var email = ""
    
    
    
    
    func setUserData(id: String, color: String, avatarName: String, name: String, email: String){
        self.id  = id
        self.avatarColor = color
        self.avatarName  = name
        self.email  = email
        self.name = name
        
    }
    
    
    func setAvatarName(avatarName: String){
        self.avatarName  = avatarName
    }
    
    
}
