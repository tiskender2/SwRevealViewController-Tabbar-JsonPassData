//
//  BegeniTableViewCell.swift
//  ios
//
//  Created by MacMini on 14.09.2017.
//  Copyright © 2017 Ortakfikir. All rights reserved.
//

import UIKit

class BegeniTableViewCell: UITableViewCell {

    @IBOutlet weak var begeniResim: UIImageView!
    @IBOutlet weak var begenIsim: UILabel!
    @IBOutlet weak var konu: UILabel!
    @IBOutlet weak var like: UIButton!
    @IBOutlet weak var comment: UIButton!
    @IBOutlet weak var share: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
