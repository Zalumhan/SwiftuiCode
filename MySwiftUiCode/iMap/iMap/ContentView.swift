//
//  ContentView.swift
//  iMap
//
//  Created by MacBookPro on 13.02.2022.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        ZStack {
            if viewModel.isUnlocked {
                Map(coordinateRegion: $viewModel.mapRegion, annotationItems: viewModel.locations) { location in
                    MapAnnotation(coordinate: location.coordinate) {
                        VStack {
                            Image(systemName: "mappin.and.ellipse")
                                .font(.title)
                                .foregroundColor(.red)
                            
                            Text(location.name)
                                .fixedSize()
                        }
                        .onTapGesture {
                            viewModel.selectedPlace = location
                        }
                    }
                }
                .ignoresSafeArea()
                
                Circle()
                    .fill(.red)
                    .opacity(0.3)
                    .frame(width: 32, height: 32)
                
                HStack {
                    Spacer()
                    Button {
                        viewModel.addLocation()
                    } label: {
                        Image(systemName: "plus")
                    }
                    .padding()
                    .background(.black.opacity(0.55))
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .padding(.trailing, 5)
                }
            } else {
                Button("Unlock Places") {
                    viewModel.authenticate()
                }
                .padding()
                .background(.red)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
        .sheet(item: $viewModel.selectedPlace) { place in
            EditView(location: place) {
                viewModel.update(location: $0)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
