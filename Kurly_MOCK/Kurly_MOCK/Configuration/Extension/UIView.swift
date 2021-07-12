//
//  UIView.swift
//  Kurly_MOCK
//
//  Created by Yi Joon Choi on 2021/03/22.
//

import UIKit

extension UIView{
    func addConstraintsWithFormat(format: String, views: UIView...)
    {
        var viewsDictionary = [String : UIView]()
        for (index, view) in views.enumerated(){
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
}
