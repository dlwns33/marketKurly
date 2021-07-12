//
//  BestResponse.swift
//  Kurly_MOCK
//
//  Created by Yi Joon Choi on 2021/03/21.
//

import Foundation
struct ProductResponse: Decodable{
    var isSuccess : Bool
    var code : Int
    var message : String
    var result : [ProductResponseResult]?
}

struct ProductResponseResult : Decodable {
    var productID : Int
    var productName : String
    var sale : Int
    var price : Int
    var imgUrl : String
    var eventID : Int
    var eventText : String?
    var saleprice : Int?
}
