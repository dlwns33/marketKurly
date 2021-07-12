//
//  CurlyRecomReqDataManager.swift
//  Kurly_MOCK
//
//  Created by Yi Joon Choi on 2021/03/21.
//

import Foundation
import Alamofire

class CurlyRecomReqDataManager{
    func reqNew(_ viewController: CurlyRecomViewController){
        AF.request("\(Constant.BASE_URL)/app/home", method: .get, parameters: nil, headers: Constant.HEADERS)
            .validate()
            .responseDecodable(of: CurlyRecomResponse.self){ response in
                switch response.result {
                case .success(let response):
//                    let result = response.result
                    if response.isSuccess {
                        viewController.didSuccess(response.result!)
                    } else {
                        viewController.failedToRequest(message: response.message)
                    }
                    print(response.message)
//                    viewController.foods = result!
//                    viewController.collectionView.reloadData()
//                    viewController.data = result!
//                    viewController.didSuccess()
//                    viewController.collectionView.reloadData()
                case .failure(let error):
                    print(error.localizedDescription)
                    print("실패")
                }
            }
    }
    
    func reqNewanonymous(_ viewController: CurlyRecomViewController){
        AF.request("\(Constant.BASE_URL)/app/anonymous", method: .get, parameters: nil, headers: Constant.HEADERS)
            .validate()
            .responseDecodable(of: CurlyRecomResponse.self){ response in
                switch response.result {
                case .success(let response):
//                    let result = response.result
                    if response.isSuccess {
                        viewController.didSuccess(response.result!)
                    } else {
                        viewController.failedToRequest(message: response.message)
                    }
                    print(response.message)
//                    viewController.foods = result!
//                    viewController.collectionView.reloadData()
//                    viewController.data = result!
//                    viewController.didSuccess()
//                    viewController.collectionView.reloadData()
                case .failure(let error):
                    print(error.localizedDescription)
                    print("실패")
                }
            }
    }
}


