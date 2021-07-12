//
//  BasketInput.swift
//  Kurly_MOCK
//
//  Created by Yi Joon Choi on 2021/03/23.
//

import Foundation

struct BasketResponse: Decodable{
    
    var isSuccess : Bool
    var code : Int
    var message : String
    var result : [BasketResult]?
    
}

struct BasketResult : Decodable {
    var address : String
}

