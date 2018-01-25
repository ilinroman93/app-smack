//
//  RoundedButton.swift
//  smack
//
//  Created by Ильин Роман on 25.01.2018.
//  Copyright © 2018 Romax. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 3.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    override func awakeFromNib() {
        self.setUpView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setUpView()
    }
    
    func setUpView() {
         self.layer.cornerRadius = cornerRadius
    }
    
}
