//
//  DetailResponse.swift
//  Kurly_MOCK
//
//  Created by Yi Joon Choi on 2021/03/22.
//

struct DetailResponse: Decodable{
    var isSuccess : Bool
    var code : Int
    var message : String
    var result : DetailResponseResult?
}

struct DetailResponseResult : Decodable {
    var Productprofile : ProfileResult?
    var Productimglist : [String]?
    var Productexplain : ExplainResult?
    var Productinfo : InfoResult?
}

struct ProfileResult : Decodable {
    var productName : String
    var quantity : Int
    var sale : Int
    var price : Int
    var category : String
    var plus : String
    var status : String
}

struct ExplainResult : Decodable {
    var unit : String?
    var weight : String?
    var delivery : String?
    var pack : String?
    var allergyinfo : String?
    var duration : String?
}

struct InfoResult : Decodable {
    var name: String
    var type: String
    var producer: String
    var duration: String
    var weight: String
    var construct: String
    var nutrition: String
    var gene: String
    var caution: String
    var income: String
    var customercall: String
}


