//
//  ChannelVC.swift
//  smack
//
//  Created by Ильин Роман on 11.01.2018.
//  Copyright © 2018 Romax. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {
    
    //Outlets
    
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {}
    
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_LOGIN, sender: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
    }


}
