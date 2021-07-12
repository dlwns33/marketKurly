//
//  DetailReqDataManager.swift
//  Kurly_MOCK
//
//  Created by Yi Joon Choi on 2021/03/22.
//

import Foundation
import Alamofire

class DetailReqDataManager{
    let ad = UIApplication.shared.delegate as! AppDelegate
    
    func reqDetail(_ viewController: ProfileViewController){
        let apiUrl : String = "\(Constant.BASE_URL)/app/product" + "/" + String(viewController.nameID)
        AF.request(apiUrl, method: .get, parameters: nil)
            .validate()
            .responseDecodable(of: DetailResponse.self){ response in
                switch response.result {
                case .success(let response):
                    print("상품정보성공")
                    print(response.message)
                    self.ad.productDetailsArray = response.result!
//                    viewController.didSuccess()
                    viewController.didSuccess(response.result!)
                    viewController.loadViewIfNeeded()
                    
//                    print(viewController.productDetailsArray)
                case .failure(let error):
                    print(error.localizedDescription)
                    print("실패")
                }
            }
    }
    
}
