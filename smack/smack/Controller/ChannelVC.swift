//
//  ChannelVC.swift
//  smack
//
//  Created by Ильин Роман on 11.01.2018.
//  Copyright © 2018 Romax. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
    }


}
