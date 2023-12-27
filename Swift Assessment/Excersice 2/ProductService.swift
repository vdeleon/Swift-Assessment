//
//  ProductService.swift
//  Swift Assessment
//
//  Created by VICTOR MANUEL DE LEON CHI on 20/12/23.
//

import Foundation
import CoreData

enum ProductServiceError: Error {
    case invalidURL
    case networkError(Error)
    case noData
    case decodingError(Error)
    case coreDataError(Error)
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
                // If there's a network error, try loading from Core Data
                self.loadProductsFromCoreData(completion: completion)
                return
            }

            guard let data = data else {
                completion(.failure(.noData))
                return
            }

            do {
                let products = try JSONDecoder().decode(Product.self, from: data)
                self.saveProductsToCoreData(products.products)
                completion(.success(products))
            } catch {
                completion(.failure(.decodingError(error)))
            }
        }.resume()
    }

    private func loadProductsFromCoreData(completion: @escaping (ProductServiceResult) -> Void) {
        let context = CoreDataStack.shared.persistentContainer.viewContext

        do {
            let fetchRequest: NSFetchRequest<NSFetchRequestResult> = CdProduct.fetchRequest()
            let productsCD = try context.fetch(fetchRequest) as? [CdProduct] ?? []
            let productElements = productsCD.map { ProductElement(
                id: 0,
                title: $0.title ?? "",
                description: "",
                price: $0.price.intValue,
                discountPercentage: 0.0,
                rating: 0.0,
                stock: 0,
                brand: "",
                category: "",
                thumbnail: $0.thumbnail ?? "",
                images: []
            )}

            let product = Product(products: productElements, total: productElements.count, skip: 0, limit: productElements.count)
            completion(.success(product))
        } catch {
            completion(.failure(.coreDataError(error)))
        }
    }


    private func saveProductsToCoreData(_ productElements: [ProductElement]) {
        let context = CoreDataStack.shared.persistentContainer.viewContext

        for productElement in productElements {
            let Cdproduct = CdProduct(context: context)
            Cdproduct.title = productElement.title
            Cdproduct.price = NSNumber(value: productElement.price)
            // Add other properties as needed
        }

        do {
            try context.save()
        } catch {
            print("Error saving to CoreData: \(error)")
        }
    }
}
