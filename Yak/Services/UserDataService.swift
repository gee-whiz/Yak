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
    
    
    func returnUIColor(components: String)->UIColor {
        let scanner = Scanner(string: components)
        let skipped = CharacterSet(charactersIn: "[], ")
        let comma =  CharacterSet(charactersIn: ",")
        scanner.charactersToBeSkipped = skipped
        
        var r,g,b,a: NSString?
        
        
        scanner.scanUpToCharacters(from: comma, into: &r)
        scanner.scanUpToCharacters(from: comma, into: &g)
        scanner.scanUpToCharacters(from: comma, into: &b)
        scanner.scanUpToCharacters(from: comma, into: &a)
        
        let defaultColor = UIColor.lightGray
        
        guard let rUnwrapped = r else {
            return defaultColor
        }
        
        guard let gUnwrapped = r else {
            return defaultColor
        }
        
        guard let bUnwrapped = r else {
            return defaultColor
        }
        guard let aUnwrapped = r else {
            return defaultColor
        }
        
        
        let rFloat = CGFloat(rUnwrapped.doubleValue)
        let gFloat = CGFloat(gUnwrapped.doubleValue)
        let bFloat = CGFloat(bUnwrapped.doubleValue)
        let aFloat = CGFloat(aUnwrapped.doubleValue)
        
        let newColor = UIColor(red: rFloat, green: gFloat, blue: bFloat, alpha: aFloat)
        return  newColor
    }
}
