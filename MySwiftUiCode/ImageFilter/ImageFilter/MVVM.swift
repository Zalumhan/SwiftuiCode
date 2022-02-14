//
//  MVVM.swift
//  ImageFilter
//
//  Created by MacBookPro on 14.02.2022.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

extension ContentView {
    @MainActor class ViewModel: ObservableObject {
        @Published var inputImage: UIImage?
        @Published var image: Image?
        @Published var processedImage: UIImage?
        @Published var intensity = 0.5
        @Published var showImagePicker = false
        @Published var showFillters = false
        @Published var currentFilter: CIFilter = CIFilter.sepiaTone()
        let context = CIContext()
        
        func setFilter(_ filter: CIFilter) {
            currentFilter = filter
            loadImage()
        }
        
        func loadImage() {
            guard let inputImage = inputImage else { return }
            
            let beginImage = CIImage(image: inputImage)
            currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
            processing()
        }
        
        func processing() {
            let inputKeys = currentFilter.inputKeys
            
            if inputKeys.contains(kCIInputIntensityKey) { currentFilter.setValue(intensity, forKey: kCIInputIntensityKey) }
            if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(intensity * 200, forKey: kCIInputRadiusKey) }
            if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(intensity * 10, forKey: kCIInputScaleKey) }
            
            if let outputImage = currentFilter.outputImage {
                if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                    let uiImage = UIImage(cgImage: cgimg)
                    image = Image(uiImage: uiImage)
                    processedImage = uiImage
                }
            }
        }
        
        func save() {
            guard let processedImage = processedImage else { return }
            
            let imageSaver = ImageSaver()
            
            imageSaver.successHandler = {
                print("Success to save Image")
            }
            
            imageSaver.errorHandler = {
                print("Failed to save: \($0.localizedDescription)")
            }
            
            imageSaver.saveImage(image: processedImage)
        }
    }
}
