//
//  LoginXViewController.swift
//  Kurly_MOCK
//
//  Created by Yi Joon Choi on 2021/03/14.
//

import UIKit

class LoginXViewController: BaseViewController {
    @IBOutlet weak var btn_login: UIButton!
    
    @IBAction func login(_ sender: Any) {
        let nextVC = LoginViewController()
        let navBarOnModal: UINavigationController = UINavigationController(rootViewController: nextVC)
        navBarOnModal.modalPresentationStyle = .overFullScreen
        self.present(navBarOnModal, animated: true, completion: nil)
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    let categories=["비회원 주문 조회","배송안내",
                    "공지사항","자주 하는 질문",
                    "고객센터","이용안내",
                    "컬리소개","알림설정"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "마이컬리"
        btn_login.kurlybutton_purple()
        
        tableView.register(LoginTableViewCell.nib(), forCellReuseIdentifier: "LoginTableViewCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}
extension LoginXViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LoginTableViewCell", for: indexPath) as! LoginTableViewCell
        
        cell.title.text = categories[indexPath.row]
        
        return cell
    }
    
    
}
