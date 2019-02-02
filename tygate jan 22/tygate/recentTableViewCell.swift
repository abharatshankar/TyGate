//
//  recentTableViewCell.swift
//  tygate
//
//  Created by Bharat shankar on 26/01/19.
//  Copyright © 2019 Bharat shankar. All rights reserved.
//

import UIKit

class recentTableViewCell: UITableViewCell {

    // for recent tab
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var favBtn: UIButton!
    
    
    
    // for recent tab
    @IBOutlet weak var cellView1: UIView!
    @IBOutlet weak var favBtnReco: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
