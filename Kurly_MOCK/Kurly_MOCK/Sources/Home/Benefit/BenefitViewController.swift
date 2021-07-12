//
//  BenefitViewController.swift
//  Kurly_MOCK
//
//  Created by Yi Joon Choi on 2021/03/19.
//

import UIKit
import Kingfisher

class BenefitViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var ads: [BenefitResponseResult] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        BenefitReqDataManager().reqNew(self)
        tableView.register(BenefitTableViewCell.nib(), forCellReuseIdentifier:  "BenefitTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension BenefitViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ads.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BenefitTableViewCell", for: indexPath) as! BenefitTableViewCell
        
        let url = URL(string: ads[indexPath.row].imgUrl)
        cell.ad.contentMode = .scaleAspectFill
        cell.ad.kf.setImage(with: url)
        return cell
    }
    
    
    
}
