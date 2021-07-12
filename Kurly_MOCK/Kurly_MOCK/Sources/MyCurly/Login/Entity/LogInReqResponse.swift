//
//  LogInReqResponse.swift
//  Kurly_MOCK
//
//  Created by Yi Joon Choi on 2021/03/17.
//

struct LogInReqResponse: Decodable{
    
    var isSuccess : Bool
    var code : Int
    var message : String
    var result : LogInReqResult?
    
}

struct LogInReqResult : Decodable {
    var userID : Int
    var nickname : String
    var jwt : String
}

