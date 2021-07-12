//
//  BillsViewController.swift
//  Kurly_MOCK
//
//  Created by Yi Joon Choi on 2021/03/25.
//

import UIKit

class BillsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var home: UILabel!
    @IBOutlet weak var name2: UILabel!
    
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var realPrice: UILabel!
    @IBOutlet weak var discountPrice: UILabel!
    
    @IBOutlet weak var totalPrice: UILabel!
    
    @IBOutlet weak var creditButton: UIButton!
    @IBOutlet weak var tossButton: UIButton!
    @IBOutlet weak var chaiButton: UIButton!
    @IBOutlet weak var naverButton: UIButton!
    
    @IBAction func purchaseRadio(_ sender: UIButton) {
        if sender.isSelected{
            sender.isSelected = false
        }
        else{
            sender.isSelected = true
        }
    }
    
    @IBAction func agreeRadio(_ sender: UIButton) {
        if sender.isSelected{
            sender.isSelected = false
        }
        else{
            sender.isSelected = true
        }
    }
    
    @IBOutlet weak var finalPurchase: UIButton!
    
    @IBAction func donePurchase(_ sender: UIButton) {
        purchase3.append(products(productID: 2, quantity: 2))
        let input = BillsInput(basketlist: purchase2)
        BillsDataManager().reqBills(input, viewController: self)
        self.changeRootViewController(BaseTabBarController())
    }
    
    var purchase2 : [products] = []
    var purchase3 : [products] = []
    var contents2 : BasketContentResult?
    var finalproductprice2 = 0
    var finalsaleprice2 = 0
    var finaltotalprice2 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "주문하기"
        
        name.text = Constant.NICKNAME
        name2.text = Constant.NICKNAME
        home.text = contents2?.address
        
        productPrice.text = String(finaltotalprice2-3000) + "원"
        realPrice.text = String(finalproductprice2) + "원"
        discountPrice.text = String(finalsaleprice2) + "원"
        totalPrice.text = String(finaltotalprice2) + "원"
        
        finalPurchase.kurlybutton_purple()
        creditButton.kurlybutton()
        tossButton.kurlybutton()
        chaiButton.kurlybutton()
        naverButton.kurlybutton()
        
        tableView.register(CategoryTableViewCell.nib(), forCellReuseIdentifier: "CategoryTableViewCell")
    
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

}
extension BillsViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (contents2?.productlist!.count)!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell", for: indexPath) as! CategoryTableViewCell
        
        let url = URL(string: (contents2?.productlist![indexPath.row].imgUrl)!)
        
        cell.icon.contentMode = .scaleAspectFill
        cell.icon.kf.setImage(with: url)
        cell.title.font = cell.title.font.withSize(15)
        cell.title.text = (contents2?.productlist![indexPath.row].productName)! + "\n" + String((contents2?.productlist![indexPath.row].price)!) + "원 | " + String(purchase2[indexPath.row].quantity) + "개"
        
        return cell
    }
    
    
}
