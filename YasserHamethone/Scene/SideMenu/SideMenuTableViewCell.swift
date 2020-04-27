//
//  SideMenuTableViewCell.swift
//  YasserHamethone
//
//  Created by Raghad'Mac on 4/24/20.
//  Copyright © 2020 Raghad'Mac. All rights reserved.
//

import UIKit

class SideMenuTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var imageName : UIImageView!
    @IBOutlet weak var spertaorLine: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       spertaorLine.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
