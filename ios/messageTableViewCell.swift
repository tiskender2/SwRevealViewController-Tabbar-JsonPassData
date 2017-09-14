//
//  messageTableViewCell.swift
//  ios
//
//  Created by MacMini on 11.09.2017.
//  Copyright © 2017 Ortakfikir. All rights reserved.
//

import UIKit

class messageTableViewCell: UITableViewCell {

    @IBOutlet weak var mesajResim: UIImageView!
    @IBOutlet weak var mesajLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
