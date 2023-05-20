//
//  Testing.swift
//  TestApp
//
//  Created by India Poetzscher on 7/5/22.
//

import SwiftUI



struct Testing: View {
    
    @State private var pollutionPercentage: Double = 80
    @State var val: Double
    
    var body: some View {
        
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [.yellow, .red, .purple]),
                startPoint: .leading,
                endPoint: .trailing
            )
            .mask(ProgressView(value: val, total: 100))
            .frame(height: 8.0)
            .scaleEffect(x: 1, y: 2, anchor: .center)
            .clipShape(RoundedRectangle(cornerRadius: 6))
            .padding(.horizontal)
            //              .accentColor(.clear)
        }
        //        ProgressView(value: pollutionPercentage, total: 100)
        //            .accentColor(.blue)
        //                      .frame(height: 8.0)
        //                      .scaleEffect(x: 1, y: 2, anchor: .center)
        //                      .clipShape(RoundedRectangle(cornerRadius: 6))
        //                      .padding(.horizontal)
    }
}

struct Testing_Previews: PreviewProvider {
    static var previews: some View {
        Testing(val: 70)
    }
}
