//
//  DetailView.swift
//  FriendList
//
//  Created by MacBookPro on 11.02.2022.
//

import SwiftUI

struct DetailView: View {
    let user: User
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 25) {
                    HStack {
                        Text("Status: ")
                        Text(user.isActive ? "Active" : "Not Active")
                    }
                    Text("Name: \(user.name)")
                    Text("Age: \(user.age)")
                    Text("Company: \(user.company)")
                    Text("Email: \(user.email)")
                    Text("Address: \(user.address)")
                    Text("About: \(user.about)")
                    Text("registered: \(user.registered)")
                    Text("Tags: \(user.tags.joined(separator: ", "))")
                    
                    Section("Friends: ") {
                        ForEach(user.friends) { friend in
                                Text(friend.name)
                        }
                    }
                }
                .font(.title)
            }
            .navigationTitle("Details")
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(user: User.example)
    }
}
