//
//  Category.swift
//  Carousel
//
//  Created by Ricardo González Pacheco on 25/05/2020.
//  Copyright © 2020 Ricardo González Pacheco. All rights reserved.
//

import Foundation

enum Category {
    case book
    case hardware
    case videogames
    
    public var categoryName: String {
        switch self {
        case .book:
            return "Book"
        case .hardware:
            return "Hardware"
        case .videogames:
            return "Videogames"
        }
    }
    
    public var groupDescription: String {
        switch self {
        case .book:
            return "Have below a selection of random books"
        case .videogames:
            return "Have below a selection of some videogames"
        case .hardware:
            return "Have below my hardware to enjoy both"
        }
    }
}
