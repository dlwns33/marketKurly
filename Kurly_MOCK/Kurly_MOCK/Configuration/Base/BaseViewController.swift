//
//  BaseViewController.swift
//  Kurly_MOCK
//
//  Created by Yi Joon Choi on 2021/03/14.
//

//모든 뷰에 공통적으로 들어가는 것을 사용한다

import Foundation
import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Navigation Bar
        self.dismissKeyboardWhenTappedAround()
        self.navigationController?.navigationBar.barTintColor = .mainPurple
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes =  [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        self.navigationController?.navigationBar.isTranslucent = false
        
        let mapButton: UIButton = UIButton(type: UIButton.ButtonType.custom)
        let basketButton: UIButton = UIButton(type: UIButton.ButtonType.custom)
                //set image for button
        mapButton.setImage(UIImage(named: "주소아이콘"), for: UIControl.State.normal)
        basketButton.setImage(UIImage(named: "장바구니아이콘"), for: UIControl.State.normal)
                //add function for button
        mapButton.addTarget(self, action: #selector(toMap), for: UIControl.Event.touchUpInside)
        basketButton.addTarget(self, action: #selector(toBasket), for: UIControl.Event.touchUpInside)
                //set frame
        mapButton.frame = CGRect(x: 0, y: 0, width: 30, height: 50)
        basketButton.frame = CGRect(x: 0, y: 0, width: 30, height: 50)

        let mapbarButton = UIBarButtonItem(customView: mapButton)
        let basketbarButton = UIBarButtonItem(customView: basketButton)
                //assign button to navigationbar
        self.navigationItem.rightBarButtonItems = [basketbarButton, mapbarButton]
        
        let backButton = UIBarButtonItem()
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    @objc func toBasket(){
        let nextVC = BasketViewController()
        let navBarOnModal: UINavigationController = UINavigationController(rootViewController: nextVC)
        navBarOnModal.modalPresentationStyle = .overFullScreen
        self.present(navBarOnModal, animated: true, completion: nil)
    }
    
    @objc func toMap(){
        let nextVC = MapViewController()
        let navBarOnModal: UINavigationController = UINavigationController(rootViewController: nextVC)
        navBarOnModal.modalPresentationStyle = .overFullScreen
        self.present(navBarOnModal, animated: true, completion: nil)
    }
}
