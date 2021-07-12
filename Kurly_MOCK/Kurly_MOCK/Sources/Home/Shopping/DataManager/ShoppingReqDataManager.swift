//
//  ShoppingReqDataManager.swift
//  Kurly_MOCK
//
//  Created by Yi Joon Choi on 2021/03/21.
//

import Foundation
import Alamofire

class ShoppingReqDataManager{
    func reqNew(_ viewController: ShoppingViewController){
        AF.request("\(Constant.BASE_URL)/app/sale", method: .get, parameters: nil)
            .validate()
            .responseDecodable(of: ProductResponse.self){ response in
                switch response.result {
                case .success(let response):
                    let result = response.result
                    viewController.foods = result!
                    viewController.collectionView.reloadData()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
}
