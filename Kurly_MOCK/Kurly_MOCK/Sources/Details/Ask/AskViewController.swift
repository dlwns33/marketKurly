//
//  AskViewController.swift
//  Kurly_MOCK
//
//  Created by Yi Joon Choi on 2021/03/24.
//

import UIKit

class AskViewController: UIViewController {

    @IBOutlet weak var ask: UIButton!
    @IBAction func toAsk(_ sender: UIButton) {
        
    }
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ask.kurlybutton()
    }

}
