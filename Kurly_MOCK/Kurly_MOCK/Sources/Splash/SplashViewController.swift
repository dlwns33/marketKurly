//
//  SplashViewController.swift
//  Kurly_MOCK
//
//  Created by Yi Joon Choi on 2021/03/14.
//

import Foundation
import UIKit

class SplashViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .mainPurple
        
        guard let userid = UserDefaults.standard.string(forKey: "id") else {return}
        guard let pw = UserDefaults.standard.string(forKey: "pw") else {return}
        
        LogInReqDataManager().reqLogin(LogInReqInput(userName: userid, password: pw), viewController: LoginViewController())
    }
    
    
}
