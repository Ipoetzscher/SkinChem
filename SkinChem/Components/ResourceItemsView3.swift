//
//  ResourceItemsView.swift
//  TestApp
//
//  Created by India Poetzscher on 4/4/22.
//

import SwiftUI

struct ResourceItemsView3: View {
    
    var thirdResource: Resource = thirdResources[0]
    
    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 16) {
            Image(systemName: "arrow.turn.down.right")
                .foregroundColor(Color.theme.accent)
            Link(thirdResource.articleTitle, destination: URL(string: thirdResource.link)!)
                .font(Font.custom("Montserrat-medium", size: 16, relativeTo: .title))
            Spacer()
        }
        //        .shadow(color: Color.theme.shadow.opacity(0.5), radius: 3, x: 3, y: 3)
    }
}

struct ResourceItemsView3_Previews: PreviewProvider {
    static var previews: some View {
        ResourceItemsView3()
    }
}
