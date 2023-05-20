//
//  PlaceholderTextAsset.swift
//  TestApp
//
//  Created by India Poetzscher on 4/6/22.
//

import SwiftUI

public struct PlaceholderStyle: ViewModifier {
    var showPlaceHolder: Bool
    var placeholder: String
    
    public func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            if showPlaceHolder {
                HStack(spacing: 20) {
                    //                    Image("map")
                    //                        .resizable()
                    //                        .aspectRatio(contentMode: .fit)
                    //                        .frame(height: 45)
                    Text(placeholder)
                        .foregroundColor(Color.theme.secondAccent)
                        .font(.custom(FontsManager.regular, size: 16))
                    Spacer()
                    
                }
                //                .padding(.vertical, 15)
            }
            content
                .foregroundColor(Color.theme.secondAccent)
                .font(.custom(FontsManager.regular, size: 16))
                .padding(.vertical, 5)
        }
    }
}
