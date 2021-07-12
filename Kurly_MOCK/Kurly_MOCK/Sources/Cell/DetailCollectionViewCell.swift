//
//  DetailCollectionViewCell.swift
//  Kurly_MOCK
//
//  Created by Yi Joon Choi on 2021/03/22.
//

import UIKit

class DetailCollectionViewCell: UICollectionViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    static func nib() -> UINib{
        return UINib(nibName: "DetailCollectionViewCell", bundle: nil)
    }
    
}
