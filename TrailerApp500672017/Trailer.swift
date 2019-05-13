//
//  Trailer.swift
//  TrailerApp500672017
//
//  Created by Joshua William on 12/05/2019.
//  Copyright © 2019 Joshua William. All rights reserved.
//

import Foundation

final class Trailer: Decodable {
    let id: Int
    let title: String
    let url: String
    let poster_image: String
    let still_image: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case id =  "id"
        case title = "title"
        case url = "url"
        case poster_image = "posterImage"
        case still_image = "stillImage"
        case description = "description"
    }
}
