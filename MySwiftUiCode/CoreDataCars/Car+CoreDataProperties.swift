//
//  Car+CoreDataProperties.swift
//  CoreDataCars
//
//  Created by MacBookPro on 11.02.2022.
//
//

import Foundation
import CoreData


extension Car {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Car> {
        return NSFetchRequest<Car>(entityName: "Car")
    }

    @NSManaged public var brand: String
    @NSManaged public var country: Country

    public var wrappedBrand: String {
        brand ?? "Unknown Brand"
    }
}

extension Car : Identifiable {

}
