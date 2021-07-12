//
//  LoginViewController.swift
//  Kurly_MOCK
//
//  Created by Yi Joon Choi on 2021/03/15.
//

import UIKit

class LoginViewController: SecondBaseViewController {

    @IBOutlet weak var btn_login: UIButton!
    @IBOutlet weak var btn_join: UIButton!
    
    @IBOutlet weak var tb_id: UITextField!
    @IBOutlet weak var tb_password: UITextField!
    
    @IBAction func login(_ sender: UIButton) {
        let input = LogInReqInput(userName: tb_id.text!, password: tb_password.text!)
        LogInReqDataManager().reqLogin(input, viewController: self)
    }
    
    
    @IBAction func join(_ sender: Any) {
        self.navigationController?.pushViewController(JoinViewController(), animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "로그인"
        btn_login.kurlybutton_purple()
        
        btn_join.kurlybutton()
        
        let exitBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(dismissScreen))
        self.navigationItem.leftBarButtonItem = exitBarButtonItem
    }
    
    @objc func dismissScreen(){
        self.dismiss(animated: true, completion: nil)
    }

}
