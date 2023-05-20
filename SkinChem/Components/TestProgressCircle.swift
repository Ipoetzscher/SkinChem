//
//  TestProgressCircle.swift
//  TestApp
//
//  Created by India Poetzscher on 7/9/22.
//

import SwiftUI

struct TestProgressCircle: View {
    
    @State var percentage: CGFloat = 19
    
    
    var body: some View {
        VStack {
            ZStack {
                Track()
                Label(percentage: percentage)
                Outline(percentage: percentage)

            }
//            HStack {
//                Button {
//                    self.percentage = CGFloat(85)
//                } label: {
//                    Image(systemName: "play.circle.fill")
//                }
//
//            }
            .padding()
        }
    }
}


struct Label: View {
    var percentage: CGFloat = 0
    var body: some View {
        ZStack {
            Text(String(format: "%.0f", percentage))
        }
    }
}


struct Outline: View {
    var percentage: CGFloat = 80
    var body: some View {
        let percentageConverted = percentage / 100
        ZStack {
            Circle()
                .fill(Color.clear)
                .overlay(
                    Circle()
                        .trim(from: 0, to: percentage * 0.01)
                        .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                        .fill(AngularGradient(colors: [.yellow, .orange, .red, .purple], center: .center, startAngle: .degrees(0), endAngle: .degrees(360 * percentageConverted)))
                        .rotationEffect(Angle(degrees: 180))
                )
                .animation(.easeInOut(duration: 0.5), value: percentage)
            
//                .animation(.spring(response: 1.0, dampingFraction: 1.0, blendDuration: 0.5))
        }
    }
}

struct Track: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(.clear)
                .overlay(
                    Circle()
                        .stroke(style: StrokeStyle(lineWidth: 20))
                        .fill(Color.black.opacity(0.1))
                )
        }
    }
}


struct TestProgressCircle_Previews: PreviewProvider {
    static var previews: some View {
        TestProgressCircle()
    }
}
