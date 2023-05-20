//
//  Testing2.swift
//  TestApp
//
//  Created by India Poetzscher on 7/9/22.
//

import SwiftUI

struct ProgressCircleFinal: View {
    let progress: Float
    //let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
//    @State private var degress: Double = -110
    
    var body: some View {
        
        VStack {
            ZStack {
                
                ProgressBar(progress: self.progress)
//                    .padding(50)
                    //.onReceive(timer) { _ in
                    //    withAnimation {
//                            if startingProgressValue < 0.001 {
//                                startingProgressValue += actualProgressValue
//                            }
                     //   }
                   // }
                
//                ProgressBarTriangle(progress: self.$progressValue).frame(width: 280.0, height: 290.0).rotationEffect(.degrees(degress), anchor: .bottom)
//                    .offset(x: 0, y: -150).onReceive(timer) { input in
//                        withAnimation(.linear(duration: 0.01).speed(200)) {
//                            if degress < 110.0 {
//                                degress += 10
//                            }
//                            print(degress)
//                        }
//                    }
            }
//            .padding()
        }
    }
    
    struct ProgressBar: View {
        let progress: Float
        
        var body: some View {
            ZStack {
                Circle()
                    .trim(from: 0.0, to: 1.0)
                    .stroke(style: StrokeStyle(lineWidth: 8.0, lineCap: .round, lineJoin: .round))
                    .opacity(0.3)
                    .foregroundColor(Color.gray)
//                    .rotationEffect(.degrees(54.5))
                
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                    .stroke(style: StrokeStyle(lineWidth: 8.0, lineCap: .round, lineJoin: .round))
                    .fill(AngularGradient(gradient: Gradient(stops: [
                        .init(color: Color.init(hex: "#FFEB23"), location: 0.09000002),
                        .init(color: Color.init(hex: "#FF9643"), location: 0.3999999),
                        .init(color: Color.init(hex: "#FF2727"), location: 0.6199998),
                        .init(color: Color.init(hex: "BC23FF"), location: 0.8999999)]), center: .center,
                                          startAngle: .degrees(0),
                                          endAngle: .degrees(350)))
                    .rotationEffect(.degrees(-180))
                
//                VStack{
//                    Text("\(progress.rounded())").font(Font.system(size: 44)).bold().foregroundColor(Color.init(hex: "314058"))
//                }
            }
        }
    }
//
//    struct ProgressBarTriangle: View {
//        @Binding var progress: Float
//
//
//        var body: some View {
//            ZStack {
//                Image("triangle").resizable().frame(width: 10, height: 10, alignment: .center)
//            }
//        }
//    }

//}

}
    
struct ProgressCircleFinal_Previews: PreviewProvider {
    static var previews: some View {
        ProgressCircleFinal(progress: 1.0)
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
