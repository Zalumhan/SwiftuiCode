//
//  ContentView.swift
//  ImageFilter
//
//  Created by MacBookPro on 12.02.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.secondary)
                    
                    VStack(spacing: 10) {
                        Image(systemName: "plus.square.dashed")
                            .font(.largeTitle)
                        Text("Tap to add photo")
                            .fontWeight(.bold)
                    }
                    .foregroundColor(.yellow)
                    
                    viewModel.image?
                        .resizable()
                        .scaledToFit()
                }
                .onTapGesture {
                    viewModel.showImagePicker = true
                }
                
                HStack {
                    Text("Intensity")
                    Slider(value: $viewModel.intensity)
                        .onChange(of: viewModel.intensity) {_ in viewModel.processing()}
                }
                .padding(.vertical)
            }
            .padding()
            .navigationTitle("ImageFilter")
            .navigationBarTitleDisplayMode(.inline)
            .onChange(of: viewModel.inputImage) { _ in viewModel.loadImage()}
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Save") {
                        viewModel.save()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Filter") {
                        viewModel.showFillters = true
                    }
                }
            }
        }
        .sheet(isPresented: $viewModel.showImagePicker) {
            ImagePicker(image: $viewModel.inputImage)
        }
        .confirmationDialog("Select a filter", isPresented: $viewModel.showFillters) {
            Button("Crystallize") { viewModel.setFilter(CIFilter.crystallize()) }
            Button("Edges") { viewModel.setFilter(CIFilter.edges()) }
            Button("Gaussian Blur") { viewModel.setFilter(CIFilter.gaussianBlur()) }
            Button("Pixellate") { viewModel.setFilter(CIFilter.pixellate()) }
            Button("Sepia Tone") { viewModel.setFilter(CIFilter.sepiaTone()) }
            Button("Unsharp Mask") { viewModel.setFilter(CIFilter.unsharpMask()) }
            Button("Vignette") { viewModel.setFilter(CIFilter.vignette()) }
            Button("Cancel", role: .cancel) { }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
