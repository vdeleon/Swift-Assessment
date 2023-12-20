//
//  ViewController.swift
//  Swift Assessment
//
//  Created by VICTOR MANUEL DE LEON CHI on 20/12/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    private var viewModel: ProductViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        setupViewModel()
        setupTableView()
        fetchProducts()
    }

    private func setupViewModel() {
        viewModel = ProductViewModel()
    }

    private func setupTableView() {
        tableView.dataSource = self
        tableView.register(ProductTableViewCell.self, forCellReuseIdentifier: "ProductCell")

        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    private func fetchProducts() {
        viewModel.fetchProducts { [weak self] in
            self?.tableView.reloadData()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfProducts
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ProductTableViewCell(style: .default, reuseIdentifier: "ProductCell")

        if let product = viewModel.product(at: indexPath.row) {
            cell.configure(with: product)
        }

        return cell
    }
}
