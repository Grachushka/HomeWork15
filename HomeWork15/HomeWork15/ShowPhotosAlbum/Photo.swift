//
//  Photo.swift
//  HomeWork15
//
//  Created by Pavel Procenko on 29/08/2019.
//  Copyright © 2019 Pavel Procenko. All rights reserved.
//

import Foundation

struct Photo: Decodable {
    
    let albumID, id: Int
    let title: String
    let url, thumbnailURL: URL
    
    enum CodingKeys: String, CodingKey {
        
        case albumID = "albumId"
        case id, title, url
        case thumbnailURL = "thumbnailUrl"
    }
}
