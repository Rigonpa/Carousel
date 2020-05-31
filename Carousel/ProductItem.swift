//
//  ProductItem.swift
//  Carousel
//
//  Created by Ricardo González Pacheco on 25/05/2020.
//  Copyright © 2020 Ricardo González Pacheco. All rights reserved.
//

import UIKit

class ProductItem: UICollectionViewCell {
    static var cellIdentifier: String = String(describing: ProductItem.self)
    
    lazy var imageView: UIImageView = {
        let iv = UIImageView(frame: .zero)
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleToFill
        return iv
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    var viewModel: ProductItemViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            imageView.image =  UIImage(named: viewModel.product.name)
            nameLabel.text = viewModel.product.name
            
            setupItemUI()
        }
    }
    
    fileprivate func setupItemUI() {
        
        contentView.backgroundColor = #colorLiteral(red: 0.9830406308, green: 0.9796965718, blue: 0.990309298, alpha: 1)
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowColor = UIColor.black.withAlphaComponent(0.3).cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 3
        layer.masksToBounds = false
        
        // MaskToBounds false and true to layer and contentView.layer for having shadow and corner radius at same time
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 8
        
        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 70),
            
            nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 33),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8)
        ])
    }
}
