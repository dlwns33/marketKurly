//
//  BasketContentResponse.swift
//  Kurly_MOCK
//
//  Created by Yi Joon Choi on 2021/03/25.
//

import Foundation
struct BasketContentResponse: Decodable{
    
    var isSuccess : Bool
    var code : Int
    var message : String
    var result : BasketContentResult?
    
}

struct BasketContentResult : Decodable {
    var address : String
    var productlist : [product]?
    var priceresult : prices?
}

struct product : Decodable {
    var productID : Int
    var productName : String
    var imgUrl : String
    var sale : Int
    var price : Int
    var type : String
    var quantity : Int
}

struct prices : Decodable {
    var total : Int?
    var saletotal : Int?
    var discount : Int?
    var point : Int?
}
