//
//  Section.swift
//  Carousel
//
//  Created by Ricardo González Pacheco on 25/05/2020.
//  Copyright © 2020 Ricardo González Pacheco. All rights reserved.
//

import Foundation

struct Section<SectionModel, ElementModel> {
    var model: SectionModel
    var elements: [ElementModel]
}
