//
//  CategoryViewController.swift
//  Kurly_MOCK
//
//  Created by Yi Joon Choi on 2021/03/14.
//

import UIKit

class CategoryViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let categories=["채소","과일·견과·쌀",
                    "수산·해산·건어물","정육·계란",
                    "국·반찬·메인요리","샐러드·간편식",
                    "면·양념·오일","생수·음료·우유·커피",
                    "간식·과자·떡","베이커리·치즈·델리",
                    "건강식품","생활용품·리빙","뷰티·바디케어",
                    "주방용품","가전제품","베이비·키즈","반려동물"]
    let images=["채소","과일",
                    "수산","정육",
                    "국","샐러드",
                    "면","생수",
                    "간식","베이커리",
                    "건강식품","생활용품","뷰티",
                    "주방용품","가전제품","베이비","반려동물"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "카테고리"
        tableView.register(CategoryTableViewCell.nib(), forCellReuseIdentifier: "CategoryTableViewCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

}

extension CategoryViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell", for: indexPath) as! CategoryTableViewCell
        
        cell.icon.image = UIImage(named: images[indexPath.row])
        cell.title.text = categories[indexPath.row]
        
        return cell
    }
    
    
}
