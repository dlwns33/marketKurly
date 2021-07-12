//
//  CurlyRecomResponse.swift
//  Kurly_MOCK
//
//  Created by Yi Joon Choi on 2021/03/21.
//
struct CurlyRecomResponse: Decodable {
    var isSuccess : Bool
    var code : Int
    var message : String
    var result : RecomResponseResult?
}

struct RecomResponseResult : Decodable {
    var Eventlist : [eventlist]?
    var Recommendlist : [recommendlist]?
    var Dailysalelist : [dailysalelist]?
    var Randeventlist : [randeventlist]?
    var Saleproductlist : [saleproductlist]?
    var MDrecommendlist : [mdlist]?
    var Newproductlist : [newproductlist]?
    var Hotproductlist : [hotproductlist]?
    var Recipelist : [String]?
}

struct eventlist : Decodable {
    var imgUrl : String
    var eventText : String
}

struct recommendlist : Decodable {
    var productID : Int
    var productName: String
    var sale : Int
    var price : Int
    var curlyonly : String
    var plus : String
    var type : String
    var imgUrl : String
    var eventID : Int
    var eventText : String?
    var saleprice : Int?
}

struct dailysalelist : Decodable {
    var productID : Int
    var productName: String
    var time: String
    var sale : Int
    var price : Int
    var imgUrl : String
    var eventID : Int
    var eventText : String?
    var saleprice : Int?
}

struct randeventlist : Decodable {
    var imgUrl : String
    var eventText : String
}

struct saleproductlist : Decodable {
    var productID : Int
    var productName: String
    var sale : Int
    var price : Int
    var imgUrl : String
    var eventID : Int
    var eventText : String?
    var saleprice : Int?
}

struct mdlist : Decodable {
    var productID : Int
    var productName: String
    var sale : Int
    var price : Int
    var category: String
    var imgUrl : String
    var eventID : Int
    var eventText : String
    var saleprice : Int?
}

struct newproductlist : Decodable {
    var productID : Int
    var productName: String
    var sale : Int
    var price : Int
    var imgUrl : String
    var eventID : Int
    var eventText : String?
    var saleprice : Int?
}

struct hotproductlist : Decodable {
    var productID : Int
    var productName: String
    var sale : Int
    var price : Int
    var imgUrl : String
    var eventID : Int
    var eventText : String
    var purchaseNum : Int
    var saleprice : Int?
}


