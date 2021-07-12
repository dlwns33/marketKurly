//
//  IntoBasketDataManager.swift
//  Kurly_MOCK
//
//  Created by Yi Joon Choi on 2021/03/25.
//

import Foundation
import Alamofire

class IntoBasketDataManager{
    func reqBasket(_ viewController: ToBuyViewController){
        let url = URL(string: "\(Constant.BASE_URL)/app/products/buy")
        let finalURL = url!.appending("productID", value: String(viewController.proID))
                          .appending("quantity", value: String(viewController.senderValue))
        AF.request(finalURL, method: .post, parameters: nil, headers: Constant.HEADERS)
            .validate()
            .responseDecodable(of: IntoBasketResponse.self){ response in
                switch response.result {
                case .success(let response):
                    if response.isSuccess{
                        viewController.didSuccess()
                    }
                    else{
                        viewController.failedToRequest(message: response.message)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    print("실패")
                }
            }
    }
    
}
