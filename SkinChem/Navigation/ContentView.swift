//
//  ContentView.swift
//  TestApp
//
//  Created by India Poetzscher on 1/1/22.
//

import SwiftUI

struct ContentView: View {
//    init(){UIScrollView().backgroundColor = UIColor.systemBackground}
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [
              .foregroundColor: UIColor.red,
              .font : UIFont(name:"Montserrat-Bold", size: 30)!]
//        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Montserrat-Bold", size: 30)!]
    }
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Text("Home")
                    Image(systemName: "house")
                }
            CalculatorView()
                .tabItem {
                    Text("Calculate")
                    Image(systemName: "plus.forwardslash.minus")
                }
            ExploreView()
                .tabItem {
                    Text("Explore")
                    Image(systemName: "magnifyingglass")
                }
            ResourcesView()
                .tabItem {
                    Text("Resources")
                    Image(systemName: "books.vertical.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .previewDevice("iPhone 11")
        ContentView()
            .previewDevice("iPhone 8")
            

    }
}
