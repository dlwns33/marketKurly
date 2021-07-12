//
//  ProfileViewController.swift
//  Kurly_MOCK
//
//  Created by Yi Joon Choi on 2021/03/24.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    @IBOutlet weak var productUnit: UILabel!
    @IBOutlet weak var productWeight: UILabel!
    @IBOutlet weak var productDelivery: UILabel!
    @IBOutlet weak var productPack: UILabel!
    @IBOutlet weak var productAllergy: UILabel!
    @IBOutlet weak var productDuration: UILabel!
    
    var nameID = 0
    var pname = "name"
    
    let ad = UIApplication.shared.delegate as! AppDelegate
    
    var productDetailsArray : DetailResponseResult?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let url = URL(string: (ad.productDetailsArray?.Productimglist![0])!)
        productImage.contentMode = .scaleAspectFill
        productImage.kf.setImage(with: url)
        productName.text = (ad.productDetailsArray?.Productprofile!.productName)!
        productPrice.text = String((ad.productDetailsArray?.Productprofile!.price)!) + "원"
        productUnit.text = (ad.productDetailsArray?.Productexplain?.unit)
        productDelivery.text = (ad.productDetailsArray?.Productexplain?.delivery)
        productAllergy.text = (ad.productDetailsArray?.Productexplain?.allergyinfo)
        productDuration.text = (ad.productDetailsArray?.Productexplain?.duration)
    }
    
    func didSuccess(_ result: DetailResponseResult ) {
        print("profile")
        productDetailsArray = result
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }

}

