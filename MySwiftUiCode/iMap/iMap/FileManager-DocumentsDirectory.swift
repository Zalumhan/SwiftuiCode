//
//  FileManager-DocumentsDirectory.swift
//  iMap
//
//  Created by MacBookPro on 13.02.2022.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
