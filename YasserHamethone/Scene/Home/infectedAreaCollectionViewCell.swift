//
//  infectedAreaCollectionViewCell.swift
//  YasserHamethone
//
//  Created by Raghad'Mac on 4/25/20.
//  Copyright © 2020 Raghad'Mac. All rights reserved.
//

import UIKit

class infectedAreaCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var cityName:UILabel!
    @IBOutlet weak var count:UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var increasedImage: UIImageView!
    
   override func awakeFromNib() {
        super.awakeFromNib()
   containerView.layer.cornerRadius = 15
   containerView.layer.masksToBounds = true
   containerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]

    }
    
    
}
