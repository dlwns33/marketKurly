//
//  BillsInput.swift
//  Kurly_MOCK
//
//  Created by Yi Joon Choi on 2021/03/25.
//

import Foundation
struct BillsInput: Encodable{
    var basketlist : [products]?
}

struct products : Encodable {
    var productID : Int
    var quantity : Int
}
