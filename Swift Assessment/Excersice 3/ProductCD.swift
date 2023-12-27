//
//  ProductCD.swift
//  Swift Assessment
//
//  Created by VICTOR MANUEL DE LEON CHI on 26/12/23.
//

import CoreData

@objc(CdProduct)
class ProductCD: NSManagedObject {
    @NSManaged public var title: String
    @NSManaged public var price: NSNumber
    @NSManaged public var thumbnail: String

}
