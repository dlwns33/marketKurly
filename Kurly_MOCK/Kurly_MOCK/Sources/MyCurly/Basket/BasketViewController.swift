//
//  BasketViewController.swift
//  Kurly_MOCK
//
//  Created by Yi Joon Choi on 2021/03/16.
//

import UIKit
import Kingfisher

class BasketViewController: SecondBaseViewController {

    @IBOutlet weak var home: UILabel!
    @IBAction func selectEvery(_ sender: UIButton) {
        if sender.isSelected{
            sender.isSelected = false
            everything = false
        }
        else{
            sender.isSelected = true
        }
    }
    
    @IBAction func toBills(_ sender: UIButton) {
        let nextVC = BillsViewController()
        nextVC.finalproductprice2 = finalproductprice
        nextVC.finalsaleprice2 = finalsaleprice
        nextVC.finaltotalprice2 = finaltotalprice + 3000
        nextVC.purchase2 = purchase
        nextVC.contents2 = contents
//        nextVC.home.text = self.home.text
        self.navigationController?.pushViewController(nextVC, animated: true)
       
    }
    
    @IBOutlet weak var selectEverything: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var salePrice: UILabel!
    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var order: UIButton!
    
    var purchase : [products] = []
    
    var realAd : [BasketResult] = []
    var contents : BasketContentResult?
    var everything = false
    
    var productprice = 0
    var saleprice = 0
    var totalprice = 0
    
    var finalproductprice = 0
    var finalsaleprice = 0
    var finaltotalprice = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "장바구니"
        let exitBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(dismissScreen))
        self.navigationItem.leftBarButtonItem = exitBarButtonItem
        home.text = "배송지를 입력해주세요"
        selectEverything.isSelected = true
        
        if Constant.USER_ID != 0{
            BasketReqDataManager().reqAd(self)
            BasketContentDataManager().reqContent(self)
        }
        
        order.kurlybutton_purple()
        self.tableView.rowHeight = 200
        
    }

    @objc func dismissScreen(){
        self.dismiss(animated: true, completion: nil)
    }
}

extension BasketViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (contents?.productlist!.count)!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasketTableViewCell", for: indexPath) as! BasketTableViewCell
        
        let url = URL(string: (contents?.productlist![indexPath.row].imgUrl)!)
        
        func set(q: Int){
            self.productprice = ((self.contents?.productlist![indexPath.row].price)! * q)
            self.finalproductprice += self.productprice
            self.productPrice.text = String(self.finalproductprice) + "원"
            
            self.saleprice = ((self.contents?.productlist![indexPath.row].sale)! * q)
            self.finalsaleprice += self.saleprice
            self.salePrice.text = String(self.finalsaleprice) + "원"
            
            self.totalprice = self.productprice - self.saleprice
            self.finaltotalprice += self.totalprice
            self.totalPrice.text = String(self.finaltotalprice + 3000)  + "원"
            
            self.order.setTitle(String(self.finaltotalprice + 3000) + "원 주문하기", for: .normal)
        }
        
        if cell.check.isSelected
        {
            cell.many = (self.contents?.productlist![indexPath.row].quantity)!
            
            purchase.append(products(productID: (self.contents?.productlist![indexPath.row].productID)!, quantity: cell.many))
        
            set(q: cell.many)
        }
        else{}
        
        cell.stepperactionBlock = {
            cell.stepper.minimumValue = Double(Int(-abs(cell.many)))
            cell.quantity.text = String(cell.many)
            if cell.plus{
                set(q: 1)
                self.purchase[indexPath.row].quantity = cell.many
            }
            else{
                set(q: -1)
                self.purchase[indexPath.row].quantity = cell.many 
            }
        }
        cell.actionBlock = {
            if cell.check.isSelected
            {
                cell.check.isSelected = false
                self.selectEverything.isSelected = false
                set(q: -abs(cell.many))
                self.purchase[indexPath.row].quantity = 0
            }
            else
            {
                cell.check.isSelected = true
                set(q: cell.many)
                self.purchase[indexPath.row].quantity = cell.many
            }
        }
        
        cell.productPic.contentMode = .scaleAspectFill
        cell.productPic.kf.setImage(with: url)
        cell.productName.text = contents?.productlist![indexPath.row].productName
        cell.productPrice.text = String((contents?.productlist![indexPath.row].price)!) + "원"
        cell.quantity.text = String((contents?.productlist![indexPath.row].quantity)!)
        return cell
    }
    
    
}
    
extension BasketViewController {
    func didSuccess() {
        tableView.register(BasketTableViewCell.nib(), forCellReuseIdentifier: "BasketTableViewCell")
    
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        var frame: CGRect = self.tableView.frame
        frame.size.height = self.tableView.contentSize.height
        self.tableView.frame = frame

        tableView.reloadData()
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
}
