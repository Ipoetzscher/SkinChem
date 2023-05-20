//
//  ResourceItemsView.swift
//  TestApp
//
//  Created by India Poetzscher on 4/4/22.
//

import SwiftUI

struct ResourceItemsView2: View {
    
    var secondResource: Resource = secondResources[2]
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: "link")
                .foregroundColor(Color.theme.accent)
            Link(secondResource.articleTitle, destination: URL(string: secondResource.link)!)
                .font(Font.custom("Montserrat-medium", size: 16, relativeTo: .title))
            Spacer()
        }
        .shadow(color: Color.theme.shadow.opacity(0.5), radius: 3, x: 3, y: 3)
    }
}

struct ResourceItemsView2_Previews: PreviewProvider {
    static var previews: some View {
        ResourceItemsView2()
    }
}
