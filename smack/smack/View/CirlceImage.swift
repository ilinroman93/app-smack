//
//  CirlceImage.swift
//  smack
//
//  Created by Ильин Роман on 27.01.2018.
//  Copyright © 2018 Romax. All rights reserved.
//

import UIKit

@IBDesignable
class CirlceImage: UIImageView {

    override func awakeFromNib() {
        setUpView()
    }
    
    func setUpView() {
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setUpView()
    }

}
