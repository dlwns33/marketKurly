//
//  UIButton.swift
//  Kurly_MOCK
//
//  Created by Yi Joon Choi on 2021/03/16.
//

import Foundation
import UIKit

// MARK: UIButton 내에 Indicator 표시
extension UIButton {
    func showIndicator() {
        let indicator = UIActivityIndicatorView()
        let buttonHeight = self.bounds.size.height
        let buttonWidth = self.bounds.size.width
        indicator.center = CGPoint(x: buttonWidth / 2, y: buttonHeight / 2)
        self.addSubview(indicator)
        indicator.startAnimating()
    }
    
    func dismissIndicator() {
        for view in self.subviews {
            if let indicator = view as? UIActivityIndicatorView {
                indicator.stopAnimating()
                indicator.removeFromSuperview()
            }
        }
    }
    
    func kurlybutton() {
        self.backgroundColor = .white
        self.layer.borderColor =  UIColor.mainPurple.cgColor
        self.layer.borderWidth = 1
        self.setTitleColor(.mainPurple, for: .normal)
        self.layer.cornerRadius = 5
    }
    
    func kurlybutton_purple() {
        self.setTitleColor(.white, for: .normal)
        self.backgroundColor = .mainPurple
        self.layer.cornerRadius = 5
    }

}
