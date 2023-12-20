//
//  LocationService.swift
//  Swift Assessment
//
//  Created by VICTOR MANUEL DE LEON CHI on 20/12/23.
//

import Foundation

class LocationService {
    static let shared = LocationService()

    private init() {}

    func fetchLocation(completion: @escaping (LocationObject?) -> Void) {
        guard let url = URL(string: "https://ipinfo.io/8.8.8.8/json") else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }

            do {
                let location = try JSONDecoder().decode(LocationObject.self, from: data)
                completion(location)
            } catch {
                print("Error decoding JSON: \(error)")
                completion(nil)
            }
        }.resume()
    }
}
