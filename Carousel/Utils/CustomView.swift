//
//  CustomView.swift
//  Carousel
//
//  Created by Ricardo González Pacheco on 27/05/2020.
//  Copyright © 2020 Ricardo González Pacheco. All rights reserved.
//

import UIKit

class CustomView: UIView {
    
    let myContentView = UIView()
    let cornerRadius: CGFloat
    
    init(cornerRadius: CGFloat,
        shadowColor: CGColor,
        xOffset: Int,
        yOffset: Int,
        alpha: Float,
        shadowRadius: CGFloat) {
        
        self.cornerRadius = cornerRadius
        
        super.init(frame: .zero)
        
        // 1. Parent view has shadow and corner radius/border
        layer.shadowColor = shadowColor
        layer.shadowOffset = CGSize(width: xOffset, height: yOffset)
        layer.shadowOpacity = alpha
        layer.shadowRadius = shadowRadius
        layer.cornerRadius = cornerRadius
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupView() {
        addSubview(myContentView)
        myContentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            myContentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            myContentView.topAnchor.constraint(equalTo: topAnchor),
            myContentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            myContentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        // 2. Child/content view has corner radius
        myContentView.layer.cornerRadius = cornerRadius
        myContentView.layer.masksToBounds = true
    }
}
