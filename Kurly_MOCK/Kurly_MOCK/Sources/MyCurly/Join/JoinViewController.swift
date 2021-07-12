//
//  JoinViewController.swift
//  Kurly_MOCK
//
//  Created by Yi Joon Choi on 2021/03/15.
//

import UIKit

class JoinViewController: SecondBaseViewController {

    @IBOutlet weak var btn_id: UIButton!
    
    @IBOutlet weak var btn_phone: UIButton!
    
    @IBOutlet weak var btn_ad: UIButton!
    
    @IBOutlet weak var btn_join: UIButton!
    
    @IBOutlet weak var btn_male: UIButton!
    @IBOutlet weak var btn_female: UIButton!
    @IBOutlet weak var btn_no: UIButton!
    @IBOutlet weak var btn_recomID: UIButton!
    @IBOutlet weak var btn_event: UIButton!
    @IBOutlet weak var btn_every: UIButton!
    @IBOutlet weak var btn_agree1: UIButton!
    @IBOutlet weak var btn_agree2: UIButton!
    @IBOutlet weak var btn_agree3: UIButton!
    @IBOutlet weak var btn_every2: UIButton!
    @IBOutlet weak var btn_sms: UIButton!
    @IBOutlet weak var btn_email: UIButton!
    @IBOutlet weak var btn_age: UIButton!
    
    @IBAction func btn_ad(_ sender: UIButton) {
        //self.present(MapAlertViewController(), animated: true, completion: nil)
    }
    

    @IBAction func btn_male(_ sender: UIButton) {
        if sender.isSelected{
            btn_male.tintColor = .lightGray
            sender.isSelected = false
        }
        else{
            btn_male.tintColor = .mainPurple
            sender.isSelected = true
            btn_female.isSelected = false
            btn_female.tintColor = .lightGray
            btn_no.isSelected = false
            btn_no.tintColor = .lightGray
        }
    }
    
    @IBAction func btn_female(_ sender: UIButton) {
        if sender.isSelected{
            btn_female.tintColor = .lightGray
            sender.isSelected = false
        }
        else{
            btn_female.tintColor = .mainPurple
            sender.isSelected = true
            btn_male.isSelected = false
            btn_male.tintColor = .lightGray
            btn_no.isSelected = false
            btn_no.tintColor = .lightGray
        }
    }
    
    @IBAction func btn_no(_ sender: UIButton) {
        if sender.isSelected{
            btn_no.tintColor = .lightGray
            sender.isSelected = false
        }
        else{
            btn_no.tintColor = .mainPurple
            sender.isSelected = true
            btn_male.isSelected = false
            btn_male.tintColor = .lightGray
            btn_female.isSelected = false
            btn_female.tintColor = .lightGray
        }
    }
    
    @IBAction func btn_recomID(_ sender: UIButton) {
        if sender.isSelected{
            btn_recomID.tintColor = .lightGray
            sender.isSelected = false
        }
        else{
            btn_recomID.tintColor = .mainPurple
            sender.isSelected = true
            btn_event.isSelected = false
            btn_event.tintColor = .lightGray
        }
    }
    
    @IBAction func btn_event(_ sender: UIButton) {
        if sender.isSelected{
            btn_event.tintColor = .lightGray
            sender.isSelected = false
        }
        else{
            btn_event.tintColor = .mainPurple
            sender.isSelected = true
            btn_recomID.isSelected = false
            btn_recomID.tintColor = .lightGray
        }
    }
    
    @IBAction func btn_every(_ sender: UIButton) {
        if sender.isSelected{
            sender.isSelected = false
            btn_every.tintColor = .lightGray
            btn_agree1.isSelected = false
            btn_agree1.tintColor = .lightGray
            btn_agree2.isSelected = false
            btn_agree2.tintColor = .lightGray
            btn_agree3.isSelected = false
            btn_agree3.tintColor = .lightGray
            btn_every2.isSelected = false
            btn_every2.tintColor = .lightGray
            btn_sms.isSelected = false
            btn_sms.tintColor = .lightGray
            btn_email.isSelected = false
            btn_email.tintColor = .lightGray
            btn_age.isSelected = false
            btn_age.tintColor = .lightGray
        }
        else{
            sender.isSelected = true
            btn_every.tintColor = .mainPurple
            btn_agree1.isSelected = true
            btn_agree1.tintColor = .mainPurple
            btn_agree2.isSelected = true
            btn_agree2.tintColor = .mainPurple
            btn_agree3.isSelected = true
            btn_agree3.tintColor = .mainPurple
            btn_every2.isSelected = true
            btn_every2.tintColor = .mainPurple
            btn_sms.isSelected = true
            btn_sms.tintColor = .mainPurple
            btn_email.isSelected = true
            btn_email.tintColor = .mainPurple
            btn_age.isSelected = true
            btn_age.tintColor = .mainPurple
        }
    }
    
    @IBAction func btn_agree1(_ sender: UIButton) {
        if sender.isSelected{
            sender.isSelected = false
            btn_agree1.tintColor = .lightGray
        }
        else{
            sender.isSelected = true
            btn_agree1.tintColor = .mainPurple
        }
    }
    
    @IBAction func btn_agree2(_ sender: UIButton) {
        if sender.isSelected{
            sender.isSelected = false
            btn_agree2.tintColor = .lightGray
        }
        else{
            sender.isSelected = true
            btn_agree2.tintColor = .mainPurple
        }
    }
    
    @IBAction func btn_agree3(_ sender: UIButton) {
        if sender.isSelected{
            sender.isSelected = false
            btn_agree3.tintColor = .lightGray
        }
        else{
            sender.isSelected = true
            btn_agree3.tintColor = .mainPurple
        }
    }
    
    @IBAction func btn_every2(_ sender: UIButton) {
        if sender.isSelected{
            sender.isSelected = false
            btn_every2.tintColor = .lightGray
            btn_sms.isSelected = false
            btn_sms.tintColor = .lightGray
            btn_email.isSelected = false
            btn_email.tintColor = .lightGray
        }
        else{
            sender.isSelected = true
            btn_every2.tintColor = .mainPurple
            btn_sms.isSelected = true
            btn_sms.tintColor = .mainPurple
            btn_email.isSelected = true
            btn_email.tintColor = .mainPurple
        }
    }
    
    @IBAction func btn_sms(_ sender: UIButton) {
        if sender.isSelected{
            sender.isSelected = false
            btn_sms.tintColor = .lightGray
        }
        else{
            sender.isSelected = true
            btn_sms.tintColor = .mainPurple
        }
    }
    
    @IBAction func btn_email(_ sender: UIButton) {
        if sender.isSelected{
            sender.isSelected = false
            btn_email.tintColor = .lightGray
        }
        else{
            sender.isSelected = true
            btn_email.tintColor = .mainPurple
        }
    }
    
    @IBAction func btn_age(_ sender: UIButton) {
        if sender.isSelected{
            sender.isSelected = false
            btn_age.tintColor = .lightGray
        }
        else{
            sender.isSelected = true
            btn_age.tintColor = .mainPurple
        }
    }
    
    @IBOutlet weak var tb_userName: UITextField!
    @IBOutlet weak var tb_password: UITextField!
    @IBOutlet weak var tb_nickname: UITextField!
    @IBOutlet weak var tb_email: UITextField!
    @IBOutlet weak var tb_ad2: UITextField!
    
    @IBAction func btn_join(_ sender: UIButton) {
        let input = JoinReqInput(userName: tb_userName.text!, password: tb_password.text!, nickname: tb_nickname.text!, email: tb_email.text!, address: tb_ad2.text!)
        JoinReqDataManager().reqJoin(input, viewController: self)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "회원가입"
        btn_join.kurlybutton_purple()
        
        btn_id.kurlybutton()
        btn_ad.kurlybutton()
        btn_phone.kurlybutton()

        btn_male.tintColor = .lightGray
        btn_female.tintColor = .lightGray
        btn_no.tintColor = .lightGray
        btn_recomID.tintColor = .lightGray
        btn_event.tintColor = .lightGray
        btn_every.tintColor = .lightGray
        btn_agree1.tintColor = .lightGray
        btn_agree2.tintColor = .lightGray
        btn_agree3.tintColor = .lightGray
        btn_every2.tintColor = .lightGray
        btn_sms.tintColor = .lightGray
        btn_email.tintColor = .lightGray
        btn_age.tintColor = .lightGray
    }

}

extension JoinViewController {
    func didSuccessJoin() {
        self.presentAlert(title: "회원가입에 성공하였습니다.")
        self.navigationController?.popViewController(animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            
        }
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
}
