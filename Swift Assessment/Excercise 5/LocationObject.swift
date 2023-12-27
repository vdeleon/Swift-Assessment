//
//  LocationObject.swift
//  Swift Assessment
//
//  Created by VICTOR MANUEL DE LEON CHI on 20/12/23.
//

import Foundation

// MARK: - LocationObject
struct LocationObject: Codable {
    let ip, hostname: String
    let anycast: Bool
    let city, region, country, loc: String
    let org, postal, timezone: String
    let readme: String
}
