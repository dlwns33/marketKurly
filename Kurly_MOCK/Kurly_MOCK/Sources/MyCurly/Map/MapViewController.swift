//
//  MapViewController.swift
//  Kurly_MOCK
//
//  Created by Yi Joon Choi on 2021/03/16.
//

import UIKit

class MapViewController: SecondBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "주소 검색"
        let exitBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(dismissScreen))
        self.navigationItem.leftBarButtonItem = exitBarButtonItem
    
}

    @objc func dismissScreen(){
        self.dismiss(animated: true, completion: nil)
    }

}
