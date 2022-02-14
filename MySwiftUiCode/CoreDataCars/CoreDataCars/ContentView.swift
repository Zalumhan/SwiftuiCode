//
//  ContentView.swift
//  CoreDataCars
//
//  Created by MacBookPro on 11.02.2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [SortDescriptor(\.fullName)]) var countries: FetchedResults<Country>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(countries, id: \.self) { country in
                    Section(country.wrappedFullName) {
                        ForEach(country.carsArray, id: \.self) { car in
                            Text(car.wrappedBrand)
                        }
                    }
                }
            }
            .navigationTitle("Car Brands")
            .toolbar {
                Button("Add") { addCars()}
            }
        }
    }
    
    func addCars() {
        let car1 = Car(context: moc)
        car1.brand = "Audi"
        car1.country = Country(context: moc)
        car1.country.shortName = "De"
        car1.country.fullName = "Germany"
        
        let car2 = Car(context: moc)
        car2.brand = "BMW"
        car2.country = Country(context: moc)
        car2.country.shortName = "De"
        car2.country.fullName = "Germany"
        
        let car3 = Car(context: moc)
        car3.brand = "Mercedes"
        car3.country = Country(context: moc)
        car3.country.shortName = "De"
        car3.country.fullName = "Germany"
        
        let car4 = Car(context: moc)
        car4.brand = "Bentley"
        car4.country = Country(context: moc)
        car4.country.shortName = "UK"
        car4.country.fullName = "United Kingdom"
        
        let car5 = Car(context: moc)
        car5.brand = "Lexus"
        car5.country = Country(context: moc)
        car5.country.shortName = "JP"
        car5.country.fullName = "Japan"
        
        let car6 = Car(context: moc)
        car6.brand = "Ford"
        car6.country = Country(context: moc)
        car6.country.shortName = "USA"
        car6.country.fullName = "United States America"
        
        let car7 = Car(context: moc)
        car7.brand = "Porsche"
        car7.country = Country(context: moc)
        car7.country.shortName = "De"
        car7.country.fullName = "Germany"
        
        let car8 = Car(context: moc)
        car8.brand = "Nisan"
        car8.country = Country(context: moc)
        car8.country.shortName = "JP"
        car8.country.fullName = "Japan"
        
        let car9 = Car(context: moc)
        car9.brand = "Jaguar"
        car9.country = Country(context: moc)
        car9.country.shortName = "UK"
        car9.country.fullName = "United Kingdom"
        
        let car10 = Car(context: moc)
        car10.brand = "Ferrari"
        car10.country = Country(context: moc)
        car10.country.shortName = "ITA"
        car10.country.fullName = "Italy"
        
        if moc.hasChanges {
            try? moc.save()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
