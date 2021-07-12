//
//  OrderListResponse.swift
//  Kurly_MOCK
//
//  Created by Yi Joon Choi on 2021/03/26.
//

import Foundation
struct OrderListResponse: Decodable{
    
    var isSuccess : Bool
    var code : Int
    var message : String
    var result : [OrderListResult]?
    
}

struct OrderListResult : Decodable {
    var logID : Int
    var productID : Int
    var productName : String
    var imgUrl : String
    var quantity : Int
    var dateBuy : String
}
