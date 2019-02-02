//
//  nearByCellTableViewCell.swift
//  tygate
//
//  Created by Bharat shankar on 24/01/19.
//  Copyright © 2019 Bharat shankar. All rights reserved.
//

import UIKit

class nearByCellTableViewCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    
    @IBOutlet weak var favBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
