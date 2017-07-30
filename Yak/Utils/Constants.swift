//
//  Constants.swift
//  Yak
//
//  Created by George Kapoya on 2017/07/29.
//  Copyright © 2017 George Kapoya. All rights reserved.
//

import Foundation

typealias completionHandler = (_ Success: Bool) ->()

//Segues
let SHOW_LOGIN = "show_login"
let SHOW_REGISTER = "show_register"
let UNWIND_TO_CHANNEL = "unwind_to_channel"


//user defaults

let TOKEN_KEY  = "token"
let LOGGED_IN_KEY = "loggedin"
let USER_EMAIL  = "user_email"


//URL
let BASE_URL = "https://yakchatting.herokuapp.com/"
let URL_REGISTER  = "\(BASE_URL)account/register"


