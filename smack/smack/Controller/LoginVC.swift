//
//  LoginVC.swift
//  smack
//
//  Created by Ильин Роман on 12.01.2018.
//  Copyright © 2018 Romax. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBAction func closePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createAccountBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}
