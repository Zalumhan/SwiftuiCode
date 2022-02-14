//
//  ImageSaver.swift
//  ImageFilter
//
//  Created by MacBookPro on 13.02.2022.
//

import Foundation
import UIKit

class ImageSaver: NSObject {
    var successHandler: (() -> Void)?
    var errorHandler: ((Error) -> Void)?
    
    func saveImage(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(completionMethod), nil)
    }
    
    @objc func completionMethod(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            errorHandler?(error)
        } else {
            successHandler?()
        }
    }
}
