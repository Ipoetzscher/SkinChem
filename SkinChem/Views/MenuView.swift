//
//  MenuView.swift
//  TestApp
//
//  Created by India Poetzscher on 10/16/22.
//

import SwiftUI

struct MenuView: View {
    
    
    var body: some View {
        
//        NavigationView {
            VStack(alignment: .leading, spacing: UIScreen.main.bounds.height * 0.01) {
                Spacer()
                Text("What do these numbers mean?")
                    .font(Font.custom("Montserrat-Medium", size: 20, relativeTo: .title))
                    .foregroundColor(Color.theme.secondAccent)
                Text("Because there is no concrete formula or standardized scale to assess this information, SkinChem’s scale returns a value that is somewhere between the best conditions and the worst conditions (from 0-100). Essentially, a high UV index and high pollution index results in a very high risk score, and vice versa.")
                    .font(Font.custom("Montserrat-Medium", size: 16, relativeTo: .title))
                    .padding(.vertical)
                    .foregroundColor(Color.theme.thirdText)
                Text("Between UVR and pollution, which is worse for your skin?")
                    .font(Font.custom("Montserrat-Medium", size: 20, relativeTo: .title))
                    .foregroundColor(Color.theme.secondAccent)
                Text("UV exposure and pollution exposure expose you to different toxic chemicals which each have different effects on your skin. Your specific skin type, genetic history, etc all contribute to your individual risk. Check out the explore page to learn the specifics!")
                    .font(Font.custom("Montserrat-Medium", size: 16, relativeTo: .title))
                    .padding(.vertical)
                    .foregroundColor(Color.theme.thirdText)
                Spacer()
                    .frame(height: UIScreen.main.bounds.height * 0.3)
            }
            
            .padding()
//            .navigationTitle(Text("/"))
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .background(Color.theme.background)
            .edgesIgnoringSafeArea(.all)

//        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
