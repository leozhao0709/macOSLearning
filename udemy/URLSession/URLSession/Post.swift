//
//  Post.swift
//  URLSession
//
//  Created by Lei Zhao on 11/6/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import Cocoa

struct Post: Codable {
    var user_id: Int
    var id: Int?
    var title: String
    var body: String
    
    enum CodingKeys: String, CodingKey {
        case user_id = "userId"
        case id
        case title
        case body
    }
}
