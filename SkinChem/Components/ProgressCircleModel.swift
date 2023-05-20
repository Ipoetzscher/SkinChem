//
//  ProgressBar.swift
//  TestApp
//
//  Created by India Poetzscher on 7/2/22.
//

import SwiftUI

struct ProgressCircle: View {
    
    @State var progressCircleValue: Double = 0.0
    @State public var progressValue: Double
    
    var body: some View {
        VStack {
            ProgressCircleModel(progress: self.$progressCircleValue)
                .padding(50).onAppear() {
                    self.progressCircleValue = progressValue
                }
        }
    }
}

struct ProgressCircleModel: View {
    @Binding var progress: Double
    var color: Color = Color.blue
    var colors: [Color] =  [Color.yellow, Color.red, Color.purple]
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 12.0)
                .opacity(0.10)
                .foregroundColor(Color.gray)
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(AngularGradient(
                    gradient: Gradient(colors: [.yellow, .orange, .red, .purple]),
                    center: .center,
                    startAngle: .degrees(0),
                    endAngle: .degrees(360.0 * progress)), style: StrokeStyle(lineWidth: 10.0, lineCap: .round))
            //                .stroke(style: StrokeStyle(lineWidth: 10.0, lineCap: .round, lineJoin: .round))
            //                .foregroundStyle(AngularGradient(gradient: Gradient(colors: colors), center: .center))
                .rotationEffect(Angle(degrees: 180))
            //                .animation(.easeInOut(duration: 0.5))
                .animation(.easeInOut(duration: 0.5), value: progress)
        }
    }
}

struct ProgressCircle_Previews: PreviewProvider {
    static var previews: some View {
        ProgressCircle(progressValue: 1.0)
    }
}
