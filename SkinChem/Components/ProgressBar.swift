//
//  ProgressBar.swift
//  TestApp
//
//  Created by India Poetzscher on 7/2/22.
//

import SwiftUI

struct ProgressBar: View {
    
    @State private var value: CGFloat = 80.0
    //    @State private var inputState: String = "testing"
    @State private var gradient1 = LinearGradient(
        gradient: Gradient(colors: [.yellow, .orange, .red, .purple]),
        startPoint: .leading,
        endPoint: .trailing
    )
    
    var body: some View {
        let gradientStyle1 = GradientProgressStyle(
            stroke: .clear,
            fill: gradient1
        )
        
        VStack {
            ProgressView(value: value/100)
                .progressViewStyle(gradientStyle1)
            ProgressView(value: value/100)
                .progressViewStyle(GradientProgressStyle(stroke: .clear, fill: gradient1, height: 10))
            
            //            Slider(value: $value, in: 0...100, step: 1)
            //            Text("State: \(value, specifier: "%.0f") %")
        }
    }
}

struct GradientProgressStyle<Stroke: ShapeStyle, Background: ShapeStyle>: ProgressViewStyle {
    var stroke: Stroke
    var fill: Background
    var height: CGFloat = 20
    var animation: Animation = .easeInOut
    
    func makeBody(configuration: Configuration) -> some View {
        let fractionCompleted = configuration.fractionCompleted ?? 0
        
        return VStack {
            ZStack(alignment: .topLeading) {
                Capsule()
                    .fill(Color.black.opacity(0.1))
                GeometryReader { geo in
                    Capsule()
                        .fill(fill)
                        .frame(maxWidth: geo.size.width * CGFloat(fractionCompleted))
                        .animation(.easeInOut(duration: 2.5), value: height)
                }
            }
            .frame(height: height)
//            .overlay(
//                Capsule()
//                    .stroke(Color.black.opacity(0.1), style: StrokeStyle(lineWidth: 2.0, lineCap: .round))
//            )
        }
    }
}


struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar()
    }
}
