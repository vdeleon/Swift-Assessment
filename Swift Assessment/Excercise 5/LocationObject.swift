//
//  LocationObject.swift
//  Swift Assessment
//
//  Created by VICTOR MANUEL DE LEON CHI on 20/12/23.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let locationObject = try? JSONDecoder().decode(LocationObject.self, from: jsonData)

import Foundation

// MARK: - LocationObject
struct LocationObject: Codable {
    let ip, hostname: String
    let anycast: Bool
    let city, region, country, loc: String
    let org, postal, timezone: String
    let readme: String
}
