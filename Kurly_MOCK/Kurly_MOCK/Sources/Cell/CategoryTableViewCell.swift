//
//  CategoryTableViewCell.swift
//  Kurly_MOCK
//
//  Created by Yi Joon Choi on 2021/03/19.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {


    @IBOutlet var icon: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var button: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    static func nib() -> UINib{
        return UINib(nibName: "CategoryTableViewCell", bundle: nil)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
