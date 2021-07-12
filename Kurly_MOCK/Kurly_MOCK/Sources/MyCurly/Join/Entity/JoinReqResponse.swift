//
//  JoinReqInput.swift
//  Kurly_MOCK
//
//  Created by Yi Joon Choi on 2021/03/17.
//

struct JoinReqResponse: Decodable{
    
    var isSuccess : Bool
    var code : Int
    var message : String
    var result : JoinReqResult?
    
}

struct JoinReqResult : Decodable {
    var userID : Int
}

