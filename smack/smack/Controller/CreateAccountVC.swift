//
//  CreateAccountVC.swift
//  smack
//
//  Created by Ильин Роман on 12.01.2018.
//  Copyright © 2018 Romax. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {
    
    // Outlets

    @IBOutlet weak var usernameTxt: UITextField!
    
    @IBOutlet weak var emailTxt: UITextField!
    
    @IBOutlet weak var passwordTxt: UITextField!
    
    @IBOutlet weak var userImg: UIImageView!
    
    // Variables
    
    var avatarName = "profileDefault"
    
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    
    @IBAction func createAccBtnPressed(_ sender: Any) {
        
        guard let name = usernameTxt.text, usernameTxt.text != "" else {
            return
        }
        
        guard let email = emailTxt.text, emailTxt.text != "" else {
            return
        }
        
        guard let password = passwordTxt.text, passwordTxt.text != "" else {
            return
        }
        
        AuthService.instance.registerUser(email: email, password: password) { (Success) in
            if Success {
                AuthService.instance.logIn(email: email, password: password, completion: { (Success) in
                    if Success {
                        AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { (Success) in
                            if Success {
                                print(UserDataService.instance.name, UserDataService.instance.avatarName)
                                self.performSegue(withIdentifier: UNWIND, sender: nil)
                            }
                        })
                    }
                })
            }
        }
     }
    
    @IBAction func pickAvatarBtnPressed(_ sender: Any) {
    }
    
    @IBAction func pickBgBtnPressed(_ sender: Any) {
    }
    
    
    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    

}
