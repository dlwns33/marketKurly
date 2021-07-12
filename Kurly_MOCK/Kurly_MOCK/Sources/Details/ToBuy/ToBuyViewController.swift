//
//  ToBuyViewController.swift
//  Kurly_MOCK
//
//  Created by Yi Joon Choi on 2021/03/23.
//

import UIKit

class ToBuyViewController: SecondBaseViewController {

    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var steps: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var toBasket: UIButton!
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        steps.text = Int(sender.value).description
        
        changedValue = Int(sender.value) * profiles!.price
        toBasket.setTitle(String(changedValue) + "원 장바구니 담기", for: .normal)
        senderValue = Int(sender.value)
    }
    
    @IBAction func intoBasket(_ sender: UIButton) {
        IntoBasketDataManager().reqBasket(self)
    }
    
    let ad = UIApplication.shared.delegate as! AppDelegate
    
    var profiles : ProfileResult?
    
    var proName = ""
    var proID = 0
    var senderValue = 0
    var changedValue = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "상품 선택"
        print("tobuy")
        print(proID)
        print(proName)
        toBasket.kurlybutton_purple()
        stepper.wraps = true
        stepper.autorepeat = true
        stepper.maximumValue = 11
        
        productName.text = proName
        profiles = ad.productDetailsArray?.Productprofile
        productPrice.text = String(profiles!.price) + "원"
        
        
        let exitBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(dismissScreen))
        self.navigationItem.leftBarButtonItem = exitBarButtonItem
    }
    
    @objc func dismissScreen(){
        self.dismiss(animated: true, completion: nil)
    }
}

extension ToBuyViewController {
    func didSuccess() {
        self.presentAlert(title: "장바구니에 담겼습니다.")
        self.dismiss(animated: true, completion: nil)
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
}

