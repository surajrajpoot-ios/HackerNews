//
//  ContentView.swift
//  HackerNews
//
//  Created by surajkumar on 05/10/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private  var networking=Networking()
    var body: some View {
        NavigationView{
            List(networking.posts){ post in
                NavigationLink(destination: DetailsView(url:post.url)){
                    HStack(alignment: .top) {
                        Text(String(post.points))
                            .font(.headline)
                        VStack(alignment: .leading) {
                            Text(post.title)
                                .font(.headline)
                            
                        }
                    }
                }
                
            }
            .navigationBarTitle("<<")
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    Button("Add") {
//                        networking.addCustomNews()
//                    }
//                }
            }
            
            
            .onAppear{
                self.networking.addCustomNews()

                self.networking.fetchData()
            }
        }
        
    }

#Preview {
    ContentView()
}

