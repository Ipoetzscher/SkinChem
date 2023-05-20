//
//  SplashView.swift
//  TestApp
//
//  Created by India Poetzscher on 4/3/22.
//

import SwiftUI

struct SplashView: View {
    
    
    @State var showContentView: Bool = false
    @State private var isActive = false
    @State private var size = 0.5
    @State private var opacity = 0.5
    
    
    var body: some View {
        if isActive {
            ContentView()
        } else {
            VStack {
                ZStack {
                    Color("BackgroundColor").ignoresSafeArea()
                    VStack {
                        //                            Text("Welcome")
                        Image("logo")
                            .resizable(capInsets: EdgeInsets())
                            .aspectRatio(contentMode: .fit)
                            .padding(30)
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.0)) {
                            self.size = 0.7
                            self.opacity = 1.0
                        }
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
        
        
        //            if showContentView {
        //                    ContentView()
        //                } else {
        //                    Button {
        //                        self.showContentView = true
        //                    } label: {
        //                        ZStack {
        //                            Color("BackgroundColor")
        //                            VStack(alignment: .leading, spacing: 50.0) {
        //                                Text("Welcome!")
        //                                    .font(.largeTitle)
        //                                    .fontWeight(.bold)
        //                                    .padding(.leading)
        //                                    .foregroundColor(Color.theme.secondAccent)
        //
        //                                Image("nature")
        //                                    .resizable(capInsets: EdgeInsets())
        //                                    .aspectRatio(contentMode: .fit)
        //                                    .padding(30)
        //
        //                                HStack {
        //                                    Text("Learn More")
        //                                    Image(systemName: "arrow.right")
        //                                }
        //                                .frame(maxWidth: .infinity)
        //                                .padding(.all, 12.0)
        //                                .foregroundColor(.white)
        //                                .background(Color.theme.accent).opacity(0.9)
        //                                .cornerRadius(8.0)
        //                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        //                                .shadow(radius: 4)
        //                            }
        //                            .padding(.horizontal, 25.0)
        //                        }
        //                        .edgesIgnoringSafeArea(.all)
        //                    }
        //                }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
//            .preferredColorScheme(.dark)
    }
}
