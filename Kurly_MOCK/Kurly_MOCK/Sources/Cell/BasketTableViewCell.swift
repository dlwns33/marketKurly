//
//  BasketTableViewCell.swift
//  Kurly_MOCK
//
//  Created by Yi Joon Choi on 2021/03/23.
//

import UIKit

class BasketTableViewCell: UITableViewCell {

    @IBOutlet weak var check: UIButton!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPic: UIImageView!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var quantity: UILabel!
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        if sender.value == 1.0
        {
            many += Int(sender.stepValue)
        }
        else if sender.value == -1.0
        {
            many -= Int(sender.stepValue)
            plus = false
        }
        sender.value = 0
        stepperactionBlock?()
    }
    
    var actionBlock: (() -> Void)? = nil
    var stepperactionBlock: (() -> Void)? = nil
    var many = 0
    var plus = true
    
    @IBAction func didTapButton(_ sender: UIButton) {
        actionBlock?()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        check.isSelected = true
        stepper.wraps = false
//        stepper.minimumValue = -10
        stepper.maximumValue = 7
    }

    static func nib() -> UINib{
        return UINib(nibName: "BasketTableViewCell", bundle: nil)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
