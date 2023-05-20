//
//  CardView.swift
//  TestApp
//
//  Created by India Poetzscher on 4/3/22.
//

import SwiftUI

struct CardView: View {
    
    var item: Item = items[6]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15.0) {
            HStack {
                Text(item.title)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                //                    .font(.title2)
                    .font(.custom(FontsManager.medium, size: 20))
                    .padding(.horizontal)
                    .foregroundColor(Color.theme.secondAccent)
                Spacer()
                //                if item.isDisease {
                //                    Image(systemName: "star.fill")
                //                }
            }
            Text(item.previewText)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .foregroundColor(Color.theme.thirdText)
            //                .font(.body)
                .font(.custom(FontsManager.regular, size: 17))
                .padding(.horizontal)
                .fixedSize(horizontal: false, vertical: true)
            NavigationLink(destination: DetailView(item: item)) {
                HStack {
                    Text("Learn More")
                        .font(.custom(FontsManager.medium, size: 16))
                    Image(systemName: "arrow.right")
                        .font(.body)
                }
                .padding(.horizontal)
            }
            .foregroundColor(Color.theme.accent)
            //            if item.isDisease {
            //                Image(systemName: "star.fill")
            //            }
            
        }
        .padding(.vertical)
        .background(Color.theme.lightAccent)
        .cornerRadius(15)
        //        .shadow(radius: 10)
        //        .shadow(color: Color.theme.accent, radius: 10, x: 10, y: 15)
        .shadow(color: Color.theme.shadow, radius: 10, x: 10, y: 15)
        
        
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
        //            .preferredColorScheme(.dark)
    }
}
