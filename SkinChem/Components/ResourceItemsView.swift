//
//  ResourceItemsView.swift
//  TestApp
//
//  Created by India Poetzscher on 4/4/22.
//

import SwiftUI

struct ResourceItemsView: View {
    
    var resource: Resource = resources[4]
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: "link")
                .foregroundColor(Color.theme.accent)
            Link(resource.articleTitle, destination: URL(string: resource.link)!)
                .font(Font.custom("Montserrat-medium", size: 16, relativeTo: .title))
            Spacer()
        }
        .shadow(color: Color.theme.shadow.opacity(0.5), radius: 3, x: 3, y: 3)
    }
}

struct ResourceItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ResourceItemsView()
    }
}

