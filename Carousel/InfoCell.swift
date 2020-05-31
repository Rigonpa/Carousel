//
//  InfoCell.swift
//  Carousel
//
//  Created by Ricardo González Pacheco on 27/05/2020.
//  Copyright © 2020 Ricardo González Pacheco. All rights reserved.
//

import UIKit

class InfoCell: UITableViewCell {
    static var cellIdentifier: String = String(describing: InfoCell.self)
    
    lazy var orangeView: UIView = {
        let view = CustomView(cornerRadius: 16,
                              shadowColor: UIColor.black.withAlphaComponent(0.3).cgColor,
                              xOffset: 0,
                              yOffset: 2,
                              alpha: 1,
                              shadowRadius: 3)
        view.backgroundColor = .orange
        view.translatesAutoresizingMaskIntoConstraints = false

        /*
        let customSublayer = CALayer()
        customSublayer.cornerRadius = 8
        customSublayer.masksToBounds = true
        view.layer.addSublayer(customSublayer)
        view.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 3
        view.layer.shadowOpacity = 0.8
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = false
        */
 
        return view
    }()
    
    lazy var infoLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .center
        label.textColor = UIColor.black
        return label
    }()
    
    
    var viewModel: InfoCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            infoLabel.text = viewModel.category.groupDescription
            setupUI()
        }
    }
    
    fileprivate func setupUI() {
        contentView.backgroundColor = .white
        
        contentView.addSubview(orangeView)
        contentView.addSubview(infoLabel)
        
        NSLayoutConstraint.activate([
            orangeView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6),
            orangeView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            orangeView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -6),
            orangeView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6),
            
            infoLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            infoLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            infoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
        ])
    }
}
