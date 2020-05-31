//
//  Cell.swift
//  Carousel
//
//  Created by Ricardo González Pacheco on 25/05/2020.
//  Copyright © 2020 Ricardo González Pacheco. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {
    static var cellIdentifier: String = String(describing: Cell.self)
    
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 100, height: 120)
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        flowLayout.minimumLineSpacing = 10
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(ProductItem.self, forCellWithReuseIdentifier: ProductItem.cellIdentifier)
        cv.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        cv.showsHorizontalScrollIndicator = false
        cv.dataSource = self
        return cv
    }()
    
    var viewModel: CellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            
            collectionView.reloadData()
            
            setupCellUI()
        }
    }
    
    fileprivate func setupCellUI() {
        contentView.layer.borderWidth = 0.5
        contentView.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.4).cgColor
        contentView.tintColor = #colorLiteral(red: 0.9830406308, green: 0.9796965718, blue: 0.990309298, alpha: 1)
        
        contentView.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
}

extension Cell: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        guard let viewModel = viewModel else { fatalError() }
        return viewModel.numberOfSections()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { fatalError() }
        return viewModel.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let viewModel = viewModel,
            let item = collectionView.dequeueReusableCell(withReuseIdentifier: ProductItem.cellIdentifier, for: indexPath) as? ProductItem else { fatalError() }
        let itemViewModel = viewModel.viewModel(at: indexPath)
        item.viewModel = itemViewModel
        return item
    }
}
