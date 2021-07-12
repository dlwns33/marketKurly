//
//  FeedbackViewController.swift
//  Kurly_MOCK
//
//  Created by Yi Joon Choi on 2021/03/24.
//

import UIKit

class FeedbackViewController: UIViewController {

    @IBOutlet weak var write: UIButton!
    @IBAction func writeFeedback(_ sender: UIButton) {
        
    }
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        write.kurlybutton()

    }

}
