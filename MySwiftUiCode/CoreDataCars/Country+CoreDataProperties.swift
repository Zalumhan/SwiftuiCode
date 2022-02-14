//
//  Country+CoreDataProperties.swift
//  CoreDataCars
//
//  Created by MacBookPro on 11.02.2022.
//
//

import Foundation
import CoreData


extension Country {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Country> {
        return NSFetchRequest<Country>(entityName: "Country")
    }

    @NSManaged public var shortName: String
    @NSManaged public var fullName: String
    @NSManaged public var cars: NSSet

    public var wrappedShortName: String {
        shortName ?? "Unknown ShortName"
    }
    
    public var wrappedFullName: String {
        fullName ?? "Unknown Fullname"
    }
    
    public var carsArray: [Car] {
        let set = cars as? Set<Car> ?? []
        return set.sorted {
            $0.wrappedBrand < $1.wrappedBrand
        }
    }
}

// MARK: Generated accessors for cars
extension Country {

    @objc(addCarsObject:)
    @NSManaged public func addToCars(_ value: Car)

    @objc(removeCarsObject:)
    @NSManaged public func removeFromCars(_ value: Car)

    @objc(addCars:)
    @NSManaged public func addToCars(_ values: NSSet)

    @objc(removeCars:)
    @NSManaged public func removeFromCars(_ values: NSSet)

}

extension Country : Identifiable {

}
