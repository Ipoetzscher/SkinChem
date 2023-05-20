//
//  SpecialNavBar.swift
//  TestApp
//
//  Created by India Poetzscher on 7/9/22.
//

import SwiftUI

struct SpecialNavBar: View {
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Montserrat-Bold", size: 30)!]
    }

    var body: some View {
        NavigationView {
            Text("Hello World!")
              .navigationBarTitle(Text("Dashboard").font(.subheadline), displayMode: .large)
            //.navigationBarTitle (Text("Dashboard"), displayMode: .inline)
        }
    }
}
