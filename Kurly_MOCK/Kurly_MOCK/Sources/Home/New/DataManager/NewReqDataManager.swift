//
//  NewResponseDataManager.swift
//  Kurly_MOCK
//
//  Created by Yi Joon Choi on 2021/03/19.
//

import Foundation
import Alamofire

class NewReqDataManager{
    func reqNew(_ viewController: NewViewController){
        AF.request("\(Constant.BASE_URL)/app/new", method: .get, parameters: nil)
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
