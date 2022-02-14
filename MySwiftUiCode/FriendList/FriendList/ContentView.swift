//
//  ContentView.swift
//  FriendList
//
//  Created by MacBookPro on 11.02.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    
    var body: some View {
        NavigationView {
            List(users) { user in
                NavigationLink {
                    DetailView(user: user)
                } label: {
                    Text(user.name)
                }

            }
            .navigationTitle("Friend List")
            .task {
                await fetchData()
            }
        }
    }
    
    func fetchData() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Url failed")
            return
        }
        
        do {
            if users.isEmpty {
                let (data, _) = try await URLSession.shared.data(from: url)
                
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let decoded = try decoder.decode([User].self, from: data)
                
                users = decoded
            }
        } catch {
            users = []
            print("Failed to load data")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
