//
//  HomeCardView1b.swift
//  TestApp
//
//  Created by India Poetzscher on 10/5/22.
//

import SwiftUI

struct HomeCardView1b: View {
        let score: Double
        @State var title: String
        @State var image: String
        let riskText: String
        @State var gradient1 = LinearGradient(
            gradient: Gradient(colors: [.yellow, .orange, .red, .purple]),
            startPoint: .leading,
            endPoint: .trailing
        )
        
        var body: some View {
            
            //Variables
            let sunScoreProgressBar: Double = score
            
            VStack(alignment: .leading, spacing: UIScreen.main.bounds.height * 0.01) {
                Text(title)
                    .padding(.top, 10)
                    .font(.custom(FontsManager.regular, size: 20))
                    .lineLimit(3)
                    .foregroundColor(.white)
                HStack(spacing: 15) {
                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 80)
                    //                                    .frame(maxWidth: .infinity)
                    Text("\(Int(score))")
                        .font(.custom(FontsManager.light, size: 50))
                        .lineLimit(2)
                        .foregroundColor(.white)
                }
                ProgressView(value: sunScoreProgressBar/12)
                    .progressViewStyle(GradientProgressStyle(stroke: .clear, fill: gradient1, height: 10))
                Text(riskText)
                    .padding(.bottom, 10)
                    .font(.custom(FontsManager.regular, size: 20))
                    .foregroundColor(.white)
            }
            .padding(.vertical, UIScreen.main.bounds.height * 0.003)
            .padding(.horizontal)
    //        .frame(maxHeight: 210)
    //        .frame(maxWidth: .infinity)
            .background(Color.theme.accent)
            .cornerRadius(20)
            .shadow(radius: 1, x: 1, y: 1.5)
        }
    }



struct HomeCardView1b_Previews: PreviewProvider {
    static var previews: some View {
        HomeCardView1b(score: 74, title: "Sun", image: "sun", riskText: "High Risk")
    }
}
