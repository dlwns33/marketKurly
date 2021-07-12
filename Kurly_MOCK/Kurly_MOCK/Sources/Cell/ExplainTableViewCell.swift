//
//  ExplainTableViewCell.swift
//  Kurly_MOCK
//
//  Created by Yi Joon Choi on 2021/03/25.
//

import UIKit

class ExplainTableViewCell: UITableViewCell {

    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var explanation: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    static func nib() -> UINib{
        return UINib(nibName: "ExplainTableViewCell", bundle: nil)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
