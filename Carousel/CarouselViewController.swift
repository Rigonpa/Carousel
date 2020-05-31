//
//  CarouselViewController.swift
//  Carousel
//
//  Created by Ricardo González Pacheco on 25/05/2020.
//  Copyright © 2020 Ricardo González Pacheco. All rights reserved.
//

import UIKit

class CarouselViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tv = UITableView(frame: .zero)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.dataSource = self
        tv.delegate = self
        tv.register(HeaderView.self, forHeaderFooterViewReuseIdentifier: HeaderView.cellIdentifier)
        tv.register(InfoCell.self, forCellReuseIdentifier: InfoCell.cellIdentifier)
        tv.register(Cell.self, forCellReuseIdentifier: Cell.cellIdentifier)
        tv.backgroundColor = #colorLiteral(red: 0.9489664435, green: 0.9490407109, blue: 0.9669724107, alpha: 1)
        tv.sectionHeaderHeight = 62
        return tv
    }()
    
    let viewModel: CarouselViewModel
    init(viewModel: CarouselViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        setupUI()
    }
    
    func setupUI() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CarouselViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsIn(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.row % 2 == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: InfoCell.cellIdentifier, for: indexPath) as? InfoCell else { fatalError() }
            let cellViewModel = viewModel.viewModel(at: indexPath) as? InfoCellViewModel
            cell.viewModel = cellViewModel
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.cellIdentifier, for: indexPath) as? Cell else { fatalError() }
            let cellViewModel = viewModel.viewModel(at: indexPath) as? CellViewModel
            cell.viewModel = cellViewModel
            return cell
        }
    }
}

extension CarouselViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderView.cellIdentifier) as? HeaderView else{ fatalError() }
        let headerViewModel = viewModel.numberOfSection(in: section)
        header.viewModel = headerViewModel
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row % 2 == 0 {
            // Even rows - InfoCell
            return 50
        }
        // Odd rows - Cell
        return 140
    }
}
