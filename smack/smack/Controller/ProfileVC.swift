//
//  ProfileVC.swift
//  smack
//
//  Created by Ильин Роман on 28.01.2018.
//  Copyright © 2018 Romax. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        
        NotificationCenter.default.addObserver(self, selector: #selector(ProfileVC.updateUserInfo(_:)), name: NOTIf_USER_DATA_DID_CHANGE, object: nil)
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func logoutBtnPressed(_ sender: Any) {
        UserDataService.instance.logoutUser()
        NotificationCenter.default.post(name: NOTIf_USER_DATA_DID_CHANGE, object: nil)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func editProfilePressed(_ sender: Any) {
        let editProfile = EditProfileVC()
        editProfile.modalPresentationStyle = .custom
        present(editProfile, animated: true, completion: nil)
    }
    
    func setUpView() {
        userName.text = UserDataService.instance.name
        userEmail.text = UserDataService.instance.email
        profileImage.image = UIImage(named: UserDataService.instance.avatarName)
        profileImage.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
        
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(ProfileVC.closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch) 
    }
    
    @objc func updateUserInfo(_ notif: Notification) {
        setUpView()
    }
    
    @objc func closeTap(_ recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }

}
