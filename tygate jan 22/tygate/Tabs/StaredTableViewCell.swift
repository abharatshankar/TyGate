//
//  StaredTableViewCell.swift
//  tygate
//
//  Created by Dr Mohan Roop on 1/24/19.
//  Copyright © 2019 Bharat shankar. All rights reserved.
//

import UIKit

class StaredTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var cellView: UIView!
    
    @IBOutlet weak var locationImg: UIImageView!
    
    
    @IBOutlet weak var locationName: UILabel!
    
    
    @IBOutlet weak var skillsLbl: UILabel!
    
    @IBOutlet weak var salaryLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
