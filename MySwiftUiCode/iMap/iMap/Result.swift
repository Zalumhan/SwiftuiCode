//
//  Result.swift
//  iMap
//
//  Created by MacBookPro on 13.02.2022.
//

import Foundation

struct Result: Codable {
    let query: Query
}

struct Query: Codable {
    let pages: [Int: Page]
}

struct Page: Codable, Comparable {
    let pageid: Int
    let title: String
    let terms: [String: [String]]?
    
    static func <(lhs: Page, rhs: Page) -> Bool {
        lhs.title < rhs.title
    }
    
    var description: String {
        terms?["description"]?.first ?? "No further information"
    }
}
