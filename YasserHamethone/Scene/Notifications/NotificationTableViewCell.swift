//
//  NotificationTableViewCell.swift
//  YasserHamethone
//
//  Created by Raghad'Mac on 4/25/20.
//  Copyright © 2020 Raghad'Mac. All rights reserved.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var notifcationLabel: UILabel!
    @IBOutlet weak var notifcationTitleLabel: UILabel!
    @IBOutlet weak var roundedView:UIView!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        roundedView.layer.cornerRadius = 2
        roundedView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
