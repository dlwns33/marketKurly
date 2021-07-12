//
//  SecondBaseViewController.swift
//  Kurly_MOCK
//
//  Created by Yi Joon Choi on 2021/03/15.
//

import Foundation
import UIKit

class SecondBaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dismissKeyboardWhenTappedAround()
        // MARK: 아래 예시들처럼 상황에 맞게 활용하시면 됩니다.
        // Navigation Bar
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes =  [
            NSAttributedString.Key.foregroundColor: UIColor.black
        ]
        self.navigationController?.navigationBar.isTranslucent = false
        
        let backButton = UIBarButtonItem()
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        self.navigationController?.navigationBar.tintColor = UIColor.black
        
//        self.navigationController?.navigationBar.titleTextAttributes = [
//            .font : UIFont.NotoSans(.medium, size: 16),
//        ]
        // Background Color
//        self.view.backgroundColor = .white
    }
}
