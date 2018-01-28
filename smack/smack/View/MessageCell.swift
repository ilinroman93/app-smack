//
//  MessageCell.swift
//  smack
//
//  Created by Ильин Роман on 28.01.2018.
//  Copyright © 2018 Romax. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
    
    // Outlets
    @IBOutlet weak var userImg: CirlceImage!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var timeStamp: UILabel!
    @IBOutlet weak var messageBodyLbl: UILabel!
    
    func configureCell(message: Message) {
        messageBodyLbl.text = message.message
        userName.text = message.userName
        userImg.image = UIImage(named: message.userAvatar)
        userImg.backgroundColor = UserDataService.instance.returnUIColor(components: message.userAvatarColor)
    }
}
