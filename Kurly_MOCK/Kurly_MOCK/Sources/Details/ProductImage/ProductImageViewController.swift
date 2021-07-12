//
//  ProductImageViewController.swift
//  Kurly_MOCK
//
//  Created by Yi Joon Choi on 2021/03/24.
//

import UIKit
import Kingfisher

class ProductImageViewController: UIViewController {

    @IBOutlet weak var detailImage: UIImageView!
    
    let ad = UIApplication.shared.delegate as! AppDelegate
    
    var imgurls : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("productImageload")
        imgurls = (ad.productDetailsArray?.Productimglist)!
        let url = URL(string: imgurls[0])
        detailImage.contentMode = .scaleAspectFill
        detailImage.kf.setImage(with: url)
    }

}
