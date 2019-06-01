//
//  FriendsDebtsTableViewCell.swift
//  Robocoll
//
//  Created by user on 3/24/19.
//  Copyright © 2019 user. All rights reserved.
//

import UIKit

class FriendsDebtsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var friendImage: UIImageView!
    @IBOutlet weak var debtCountLabel: UILabel!
    @IBOutlet weak var debtDateLabel: UILabel!
    @IBOutlet weak var userPhoneLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
