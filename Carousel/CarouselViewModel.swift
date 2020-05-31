//
//  CarouselViewModel.swift
//  Carousel
//
//  Created by Ricardo González Pacheco on 25/05/2020.
//  Copyright © 2020 Ricardo González Pacheco. All rights reserved.
//

import Foundation

typealias SectionType = Section<HeaderViewModel, GenericCellViewModel>

class CarouselViewModel {
    
    let sections: [SectionType]
    init(products: [Product]) {
        sections = products.reduce([SectionType](), { (previous, product) -> [SectionType] in
            var mutablePrevious = previous // We create mutablePrevious as previous is a let variable which can not mutate.
            
            if let existingSection = mutablePrevious.first(where: { (section) -> Bool in
                return section.model.category == product.category
            }) {
                // Case where corresponding section is already setted up.
                let cellViewModel = existingSection.elements[1] as? CellViewModel
                cellViewModel?.products.append(product)
                
            } else {
                // Case where corresponding section still does not exist.
                let headerViewModel = HeaderViewModel(category: product.category)
                let infoCellViewModel = InfoCellViewModel(category: product.category)
                let cellViewModel = CellViewModel()
                cellViewModel.products.append(product)
                
                let newSection = SectionType(model: headerViewModel, elements: [infoCellViewModel, cellViewModel])
                mutablePrevious.append(newSection)
            }
            
            return mutablePrevious
        })
    }
    
    // MARK: - Table view methods
    func numberOfSections() -> Int {
        return sections.count
    }
    
    func numberOfRowsIn(section: Int) -> Int {
        return sections[section].elements.count // Last cell is info cell
    }
    
    func viewModel(at indexPath: IndexPath) -> GenericCellViewModel {
        guard indexPath.row < sections.count else { fatalError() }
        return sections[indexPath.section].elements[indexPath.row]
    }
    
    func numberOfSection(in section: Int) -> HeaderViewModel {
        return sections[section].model
    }
    
}
