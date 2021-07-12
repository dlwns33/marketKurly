//
//  LoginTableViewCell.swift
//  Kurly_MOCK
//
//  Created by Yi Joon Choi on 2021/03/26.
//

import UIKit

class LoginTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var desc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        desc.text = ""
    }

    static func nib() -> UINib{
        return UINib(nibName: "LoginTableViewCell", bundle: nil)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
