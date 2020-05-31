//
//  CarouselTableViewCell.swift
//  Carousel
//
//  Created by Ricardo González Pacheco on 25/05/2020.
//  Copyright © 2020 Ricardo González Pacheco. All rights reserved.
//

import Foundation

class CellViewModel: GenericCellViewModel {
    
    var products: [Product] = [] {
        didSet {
            productItemViewModels = products.map({ (product) -> ProductItemViewModel in
                return ProductItemViewModel(product: product)
            })
        }
    }
    
    var productItemViewModels: [ProductItemViewModel] = []
    
    // MARK: - Collection view methods
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfItems() -> Int {
        return productItemViewModels.count
    }
    
    func viewModel(at indexPath: IndexPath) -> ProductItemViewModel {
        return productItemViewModels[indexPath.row]
    }
}
