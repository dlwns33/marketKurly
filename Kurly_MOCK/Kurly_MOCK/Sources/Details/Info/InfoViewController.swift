//
//  InfoViewController.swift
//  Kurly_MOCK
//
//  Created by Yi Joon Choi on 2021/03/24.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let ad = UIApplication.shared.delegate as! AppDelegate
    
    let titles = ["식품의 유형","상품명",
                    "생산자/소재지","포장단위별 용량",
                    "유통기한","보관 방법 및 취급방법",
                    "원재료 및 함량","원산지",
                    "영양성분","소비자상담실전화"]
    
    var infos : InfoResult?
    override func viewDidLoad() {
        super.viewDidLoad()

        infos = ad.productDetailsArray?.Productinfo
        
        tableView.register(ExplainTableViewCell.nib(), forCellReuseIdentifier: "ExplainTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        
    }

}

extension InfoViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExplainTableViewCell", for: indexPath) as! ExplainTableViewCell
        
        cell.type.text = titles[indexPath.row]
        
        if indexPath.row != 9
        {
            cell.explanation.text = infos?.name
        }
        else
        {
            cell.explanation.text = infos?.customercall
        }
        
        return cell
    }
    
    
}
