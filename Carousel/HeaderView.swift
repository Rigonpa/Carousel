//
//  HeaderView.swift
//  Carousel
//
//  Created by Ricardo González Pacheco on 25/05/2020.
//  Copyright © 2020 Ricardo González Pacheco. All rights reserved.
//

import UIKit

class HeaderView: UITableViewHeaderFooterView {
    static var cellIdentifier: String = String(describing: HeaderView.self)
    
    lazy var sectionLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    var viewModel: HeaderViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            sectionLabel.text = viewModel.category.categoryName
            
            setupUI()
        }
    }
    
    fileprivate func setupUI() {
        
        tintColor = #colorLiteral(red: 0.9489664435, green: 0.9490407109, blue: 0.9669724107, alpha: 1)
        addSubview(sectionLabel)
        
        NSLayoutConstraint.activate([
            sectionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            sectionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
        ])
    }
}
