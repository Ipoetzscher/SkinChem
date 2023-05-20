//
//  ToggleView.swift
//  TestApp
//
//  Created by India Poetzscher on 5/15/22.
//

import SwiftUI

struct ToggleView: View {
    @Binding var isOn:Bool
    let label: String
    let imageName: String
    var body: some View {
        //        Toggle(label, isOn: $isOn)
        Toggle(isOn: $isOn, label: {
            HStack(spacing: 20) {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 45)
                Text(label)
                    .font(.custom(FontsManager.regular, size: 16))
            }
        })
        .onAppear() {
            isOn = false
        }
        .foregroundColor(Color.theme.secondAccent)
        .padding(.horizontal)
        .padding(.vertical, 14)
        
        //            .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.theme.thirdText, lineWidth: 0.5)
        )
        .background(Color.theme.background3)
        .padding(.horizontal, UIScreen.main.bounds.width * 0.05)
        .tint(Color.theme.accent.opacity(0.9))
    }
}

struct ToggleView_Previews: PreviewProvider {
    static var previews: some View {
        ToggleView(isOn: .constant(true), label: "test label", imageName: "sun")
    }
}
