//
//  ProductService.swift
//  Swift Assessment
//
//  Created by VICTOR MANUEL DE LEON CHI on 20/12/23.
//

import Foundation

enum ProductServiceError: Error {
    case invalidURL
    case networkError(Error)
    case noData
    case decodingError(Error)
}

enum ProductServiceResult {
    case success(Product)
    case failure(ProductServiceError)
}

class ProductService {
    func fetchProducts(completion: @escaping (ProductServiceResult) -> Void) {
        guard let url = URL(string: "https://dummyjson.com/products") else {
            completion(.failure(.invalidURL))
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(.networkError(error)))
                return
            }

            guard let data = data else {
                completion(.failure(.noData))
                return
            }

            do {
                let products = try JSONDecoder().decode(Product.self, from: data)
                completion(.success(products))
            } catch {
                completion(.failure(.decodingError(error)))
            }
        }.resume()
    }
}
