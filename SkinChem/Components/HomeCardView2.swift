//
//  SwiftUIView.swift
//  TestApp
//
//  Created by India Poetzscher on 7/5/22.
//

import SwiftUI

struct HomeCardView2: View {
    
    let score: Double
    let riskText: String
    
    
    var body: some View {
        VStack(spacing: UIScreen.main.bounds.height * 0.02) {
            Text("Risk Score")
                .font(.custom(FontsManager.medium, size: 30))
                .lineLimit(2)
                .font(.title)
                .foregroundColor(Color.theme.secondText)
            ZStack {
//                ProgressCircle(progressValue: score / 100)
//                    .frame(height: 230)
                ProgressCircleFinal(progress: Float(score) / 100)
//                    .padding(50)
                    .frame(height: UIScreen.main.bounds.height * 0.16)

                //                            Image("circle")
                //                                .resizable()
                //                                .aspectRatio(contentMode: .fit)
                //                                .frame(height: 150)
                //                                    .frame(maxWidth: .infinity)
                Text("\(Int(score))")
                    .font(.custom(FontsManager.light, size: 50))
                    .foregroundColor(Color.theme.secondText)
            }
            Text(riskText)
                .fixedSize(horizontal: false, vertical: true)
                .font(.custom(FontsManager.regular, size: 20))
                .multilineTextAlignment(.center)
                .foregroundColor(Color.theme.secondText)
                //.padding(.horizontal)
        }
//        .frame(height: 300)
//        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.theme.background2)
        .cornerRadius(20)
        .shadow(radius: 2)
    }
}


struct HomeCardView2_Previews: PreviewProvider {
    static var previews: some View {
        HomeCardView2(score: 50, riskText: "Today's conditions are quite risky! Take precautions and be concious about your exposure.")
    }
}
