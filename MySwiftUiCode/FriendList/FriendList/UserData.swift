//
//  UserData.swift
//  FriendList
//
//  Created by MacBookPro on 11.02.2022.
//

import Foundation

struct Frined: Codable, Identifiable {
    let id: UUID
    let name: String
}

struct User: Codable, Identifiable {
    let id: UUID
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date
    let tags: [String]
    let friends: [Frined]
    
    static let example = User(id: UUID(), isActive: true, name: "John", age: 33, company: "Apple", email: "Myemai@icloud.com", address: "Cupertino", about: "I'm a good person and worker", registered: Date(), tags: ["friend", "good person", "employee"], friends: [Frined(id: UUID(), name: "Alex"), Frined(id: UUID(), name: "Mark"), Frined(id: UUID(), name: "Anna")])
}
