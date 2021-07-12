//
//  OrderListViewController.swift
//  Kurly_MOCK
//
//  Created by Yi Joon Choi on 2021/03/26.
//

import UIKit

class OrderListViewController: BaseViewController {

    @IBOutlet weak var allAgain: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var orders : [OrderListResult] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "주문 내역 상세"
        allAgain.kurlybutton()
        allAgain.layer.borderColor = UIColor.lightGray.cgColor
        allAgain.setTitleColor(.black, for: .normal)
        
        OrderListDataManager().myOrder(self)
    }


}

extension OrderListViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell", for: indexPath) as! CategoryTableViewCell
        
        let url = URL(string: orders[indexPath.row].imgUrl)
        cell.icon.contentMode = .scaleAspectFit
        cell.icon.kf.setImage(with: url)
        cell.title.font = cell.title.font.withSize(15)
        cell.title.text = orders[indexPath.row].productName + " | " + String(orders[indexPath.row].quantity) + "개\n" + orders[indexPath.row].dateBuy
        return cell
    }
    
    
}

extension OrderListViewController {
    func didSuccess() {
        tableView.register(CategoryTableViewCell.nib(), forCellReuseIdentifier: "CategoryTableViewCell")
    
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
