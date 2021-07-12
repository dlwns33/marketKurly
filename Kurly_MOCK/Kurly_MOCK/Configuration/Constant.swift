//
//  Constant.swift
//  Kurly_MOCK
//
//  Created by Yi Joon Choi on 2021/03/17.
//

import Alamofire

struct Constant {
    static let BASE_URL = "https://dev.hapoom.site"
    static var USER_ID = 0
    static var NICKNAME = ""
    static var HEADERS : HTTPHeaders = ["x-access-token" : JwtToken.token]
}
