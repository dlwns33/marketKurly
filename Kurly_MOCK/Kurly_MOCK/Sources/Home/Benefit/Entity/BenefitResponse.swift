//
//  BenefitResponse.swift
//  Kurly_MOCK
//
//  Created by Yi Joon Choi on 2021/03/21.
//

import Foundation
struct BenefitResponse: Decodable{
    var isSuccess : Bool
    var code : Int
    var message : String
    var result : [BenefitResponseResult]?
}

struct BenefitResponseResult : Decodable {
    var imgUrl : String
    var eventText : String
}
