//
//  IntoBasketResponse.swift
//  Kurly_MOCK
//
//  Created by Yi Joon Choi on 2021/03/25.
//

import Foundation
struct IntoBasketResponse: Decodable{
    var isSuccess : Bool
    var code : Int
    var message : String
    var result : IntoBasketResponseResult?
}

struct IntoBasketResponseResult : Decodable {
    var productName : String
    var quantity : String
    var sale : Int
    var price : Int
    var category : String
    var plus : String
    var saleprice : Int?
    var total : Int
    var point : Int?
}
