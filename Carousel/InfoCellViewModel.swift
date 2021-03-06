//
//  InfoCellViewModel.swift
//  Carousel
//
//  Created by Ricardo González Pacheco on 27/05/2020.
//  Copyright © 2020 Ricardo González Pacheco. All rights reserved.
//

import Foundation

class InfoCellViewModel: GenericCellViewModel {
    
    let category: Category
    init(category: Category) {
        self.category = category
    }
}
