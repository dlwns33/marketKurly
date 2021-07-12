//
//  LoginOViewController.swift
//  Kurly_MOCK
//
//  Created by Yi Joon Choi on 2021/03/17.
//

import UIKit

class LoginOViewController: BaseViewController {

    
    @IBOutlet weak var img_profile: UIImageView!
    @IBOutlet weak var btn_level1: UIButton!
    @IBOutlet weak var btn_level2: UIButton!
    @IBOutlet weak var label_name: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func logout(_ sender: UIButton) {
        Constant.NICKNAME = ""
        JwtToken.token = ""
        Constant.HEADERS = ["x-access-token" : JwtToken.token]
        print(Constant.HEADERS)
        UserDefaults.standard.removeObject(forKey: "id")
        UserDefaults.standard.removeObject(forKey: "pw")
        self.changeRootViewController(BaseTabBarController())
    }
    
    let categories=["적립금","쿠폰",
                    "친구초대","주문내역",
                    "배송지 관리","상품 후기",
                    "상품 문의","1:1 문의",
                    "대량주문 문의","배송 안내",
                    "공지사항","자주하는 질문","고객센터",
                    "이용안내","컬리소개","컬리패스","개인정보 수정","알림설정"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "마이컬리"
        
        img_profile.tintColor = .mainPurple
        img_profile.image = UIImage(named: "컬리등급")
        btn_level1.layer.cornerRadius = 20
        btn_level2.layer.cornerRadius = 20
        label_name.text = Constant.NICKNAME + "님"
        
        tableView.register(LoginTableViewCell.nib(), forCellReuseIdentifier: "LoginTableViewCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

}
extension LoginOViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 3{
            self.navigationController?.pushViewController(OrderListViewController(), animated: true)
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LoginTableViewCell", for: indexPath) as! LoginTableViewCell
        
        cell.desc.textColor = .mainPurple
        if indexPath.row == 0{
            cell.desc.text = "1698원"
        }
        else if indexPath.row == 1{
            cell.desc.text = "4장"
        }
        else if indexPath.row == 2{
            cell.desc.text = "지금 5,000원 받기"
        }
        else{
            cell.desc.text = ""
        }
        
        
        cell.title.text = categories[indexPath.row]
        
        return cell
    }
    
    
}
