//
//  ProductViewModel.swift
//  Swift Assessment
//
//  Created by VICTOR MANUEL DE LEON CHI on 20/12/23.
//

import Foundation

class ProductViewModel {
    private let productService: ProductService
    private(set) var products: Product?

    var numberOfProducts: Int {
        return products?.products.count ?? 0
    }

    init(productService: ProductService = ProductService()) {
        self.productService = productService
    }

    func fetchProducts(completion: @escaping () -> Void) {
        productService.fetchProducts { [weak self] result in
            switch result {
            case .success(let products):
                self?.products = products
            case .failure(let error):
                print("Error fetching products: \(error)")
            }

            DispatchQueue.main.async {
                completion()
            }
        }
    }

    func product(at index: Int) -> ProductElement? {
        return products?.products[index]
    }
}
