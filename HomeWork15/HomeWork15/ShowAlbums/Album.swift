//
//  Album.swift
//  HomeWork15
//
//  Created by Pavel Procenko on 29/08/2019.
//  Copyright © 2019 Pavel Procenko. All rights reserved.
//

import Foundation

struct Album: Decodable {
    
    let userID, id: Int
    let title: String
    
    enum CodingKeys: String, CodingKey {
        
        case userID = "userId"
        case id, title
    }
}
