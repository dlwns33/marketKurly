//
//  ProductCollectionViewCell.swift
//  Kurly_MOCK
//
//  Created by Yi Joon Choi on 2021/03/19.
//

import UIKit
import Kingfisher

class ProductCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titlePro: UILabel!
    @IBOutlet weak var pricePro: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with imageUrl: String, title: String, price: Int)
    {
        let url = URL(string: imageUrl)
        imageView.contentMode = .scaleAspectFill
        imageView.kf.setImage(with: url)
        titlePro.text = title
        pricePro.text = String(price) + "원"
    }
    
    static func nib() -> UINib{
        return UINib(nibName: "ProductCollectionViewCell", bundle: nil)
    }

}
