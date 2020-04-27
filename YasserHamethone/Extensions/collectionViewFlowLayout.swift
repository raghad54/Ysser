//
//  collectionViewFlowLayout.swift
//  YasserHamethone
//
//  Created by Raghad'Mac on 4/26/20.
//  Copyright © 2020 Raghad'Mac. All rights reserved.
//

import Foundation
import UIKit


class CustomCellFlowLayout: UICollectionViewFlowLayout {

    
    override init() {
        super.init()
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayout()
    }
    
    var cellsPerRow: Int = 2
    var height : CGFloat = 193
    override var itemSize: CGSize {
        get {
            guard let collectionView = collectionView else { return super.itemSize }
            let marginsAndInsets = sectionInset.left + sectionInset.right + minimumInteritemSpacing * CGFloat(cellsPerRow - 1)
            let itemWidth = ((collectionView.bounds.size.width - marginsAndInsets) / CGFloat(cellsPerRow)).rounded(.down)
            return CGSize(width: itemWidth, height: height )
        }
        set {
            super.itemSize = newValue
        }
    }


    func setupLayout() {
        
        minimumInteritemSpacing = 15
        minimumLineSpacing = 15
        scrollDirection = .vertical
        self.sectionInset =  UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    }
    
    
//    init(cellsPerRow: Int, minimumInteritemSpacing: CGFloat = 0, minimumLineSpacing: CGFloat = 0, sectionInset: UIEdgeInsets = .zero) {
//        self.cellsPerRow = cellsPerRow
//        super.init()
//
//        self.minimumInteritemSpacing = minimumInteritemSpacing
//        self.minimumLineSpacing = minimumLineSpacing
//        self.sectionInset = sectionInset
//    }
    


}

//Mark:- Custom shadow for cell

extension UICollectionViewCell {
    func  shadowCollectionCell(cell:UICollectionViewCell){
              cell.layer.masksToBounds = false
//              cell.layer.shadowColor = UIColor.black.cgColor
//              cell.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
//              cell.layer.shadowOpacity = 0.2
              cell.layer.shadowRadius = 20
              
          }
    
  
      
}
