//
//  EditProfileVC.swift
//  smack
//
//  Created by Ильин Роман on 29.01.2018.
//  Copyright © 2018 Romax. All rights reserved.
//

import UIKit

class EditProfileVC: UIViewController {
    
    // Outlets
    
    @IBOutlet weak var newUserNameTxtField: UITextField!
    @IBOutlet weak var newUserEmailTxtField: UITextField!
    @IBOutlet weak var userImg: CirlceImage!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    // Variables
    var newUserAvatarColor: UIColor?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
        NotificationCenter.default.addObserver(self, selector: #selector(EditProfileVC.updateImage(_:)), name: NOTIF_USER_DATA_EDITED, object: nil)
    }
    
    
    
    @IBAction func pickAvatarBtnPressed(_ sender: Any) {
        let avatarPicker = EditAvatarVC()
        avatarPicker.modalPresentationStyle = .custom
        present(avatarPicker, animated: true, completion: nil)
    }
    
    @IBAction func pickAvatarColorBtnPressed(_ sender: Any) {
        let r = CGFloat(arc4random_uniform(255)) / 255
        let g = CGFloat(arc4random_uniform(255)) / 255
        let b = CGFloat(arc4random_uniform(255)) / 255
        
        newUserAvatarColor = UIColor(red: r, green: g, blue: b, alpha: 1)
        UserDataService.instance.setEditedAvatarColor(color: "[\(r), \(g), \(b), 1]")
        UIView.animate(withDuration: 0.2) {
            self.userImg.backgroundColor = self.newUserAvatarColor
        }
        
    }
    
    @objc func updateImage(_ notif: Notification) {
        if UserDataService.instance.editedAvatarName != "" {
            userImg.image = UIImage(named: UserDataService.instance.editedAvatarName)
        } else {
            userImg.image = UIImage(named: UserDataService.instance.avatarName)
        }
    }
    
    @IBAction func saveAndExitBtnPressed(_ sender: Any) {
        spinner.isHidden = false
        spinner.startAnimating()
        
        if AuthService.instance.isLoggedIn {
            
            var newName: String!
            var newEmail: String!
            var newAvatarColor: String!
            var newAvatarName: String!
            
            guard let name = newUserNameTxtField.text else { return }
            guard let email = newUserEmailTxtField.text else { return }
            
            if name == "" {
                newName = UserDataService.instance.name
            } else {
                newName = name
            }
            
            if email == "" {
                newEmail = UserDataService.instance.email
            } else {
                newEmail = email
            }
            
            if UserDataService.instance.editedAvatarColor == "" {
                newAvatarColor = UserDataService.instance.avatarColor
            } else {
                newAvatarColor = UserDataService.instance.editedAvatarColor
            }
            
            if UserDataService.instance.editedAvatarName == "" {
                newAvatarName = UserDataService.instance.avatarName
            } else {
                newAvatarName = UserDataService.instance.editedAvatarName
            }
            
            AuthService.instance.updateUserInfo(name: newName, email: newEmail, avatarName: newAvatarName, avatarColor: newAvatarColor, completion: { (success) in
                if success {
                    self.spinner.isHidden = true
                    self.spinner.stopAnimating()
                    UserDataService.instance.clearEditVariables()
                    NotificationCenter.default.post(name: NOTIf_USER_DATA_DID_CHANGE, object: nil)
                    self.dismiss(animated: true, completion: nil)
                }
            })
        }
    }
    
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        UserDataService.instance.clearEditVariables()
        dismiss(animated: true, completion: nil)
    }
    
    func setUpView() {
        userImg.image = UIImage(named: UserDataService.instance.avatarName)
        userImg.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
        newUserNameTxtField.attributedPlaceholder = NSAttributedString(string: "new username", attributes: [NSAttributedStringKey.foregroundColor: SMACK_PURPLE_PLACEHOLDER])
        newUserEmailTxtField.attributedPlaceholder = NSAttributedString(string: "new email", attributes: [NSAttributedStringKey.foregroundColor: SMACK_PURPLE_PLACEHOLDER])
        spinner.isHidden = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(EditProfileVC.handleTap))
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }
}
