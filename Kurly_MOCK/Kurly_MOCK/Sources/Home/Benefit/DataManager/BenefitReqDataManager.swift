//
//  BenefitReqDataManager.swift
//  Kurly_MOCK
//
//  Created by Yi Joon Choi on 2021/03/21.
//

import Foundation
import Alamofire

class BenefitReqDataManager{
    func reqNew(_ viewController: BenefitViewController){
        AF.request("\(Constant.BASE_URL)/app/event", method: .get, parameters: nil)
            .validate()
            .responseDecodable(of: BenefitResponse.self){ response in
                switch response.result {
                case .success(let response):
                    let result = response.result
                    viewController.ads = result!
                    viewController.tableView.reloadData()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
}
