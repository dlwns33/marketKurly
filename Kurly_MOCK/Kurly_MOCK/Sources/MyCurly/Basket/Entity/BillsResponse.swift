//
//  BillsResponse.swift
//  Kurly_MOCK
//
//  Created by Yi Joon Choi on 2021/03/25.
//

import Foundation
struct BillsResponse: Decodable{
    
    var isSuccess : Bool
    var code : Int
    var message : String
    var result : BillsResult?
    
}

struct BillsResult : Decodable {
    var address : String
    var nickname : String
    var couponlist : [String]?
    var total : Int?
    var saletotal : Int?
    var discount : Int?
    var point : Int?
}
