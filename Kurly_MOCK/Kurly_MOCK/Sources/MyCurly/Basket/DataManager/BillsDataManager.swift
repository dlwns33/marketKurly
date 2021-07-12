//
//  BillsDataManager.swift
//  Kurly_MOCK
//
//  Created by Yi Joon Choi on 2021/03/25.
//

import Foundation
import Alamofire

class BillsDataManager{
    func reqBills(_ parameters: BillsInput, viewController: BillsViewController){
        let apiUrl : String = "\(Constant.BASE_URL)/app/baskets/buy"
        AF.request(apiUrl, method: .post, parameters: parameters, headers: Constant.HEADERS)
            .validate()
            .responseDecodable(of: BillsResponse.self){ response in 
                switch response.result {
                case .success(let response):
                    print("성공ㄱ성공")
                    print(response.message)
//                    viewController.didSuccess()
//                    viewController.didSuccess(response.result!)
//                    print(viewController.productDetailsArray)
                case .failure(let error):
                    print(error.localizedDescription)
                    print("실패")
                }
            }
    }
    
}
