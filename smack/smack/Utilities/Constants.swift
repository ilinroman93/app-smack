//
//  Constants.swift
//  smack
//
//  Created by Ильин Роман on 12.01.2018.
//  Copyright © 2018 Romax. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

//Segues

let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"
let TO_AVATAR_PICKER = "toAvatarPicker"

// Colors
let SMACK_PURPLE_PLACEHOLDER = #colorLiteral(red: 0.3254901961, green: 0.4196078431, blue: 0.7764705882, alpha: 0.5)

// Notifications Constants
let NOTIf_USER_DATA_DID_CHANGE = Notification.Name("notifUserDataChanged")

// User Defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

// URL constants
let BASE_URL = "https://my-slack-clone-irs.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USER_ADD = "\(BASE_URL)user/add"

// Headers

let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]



