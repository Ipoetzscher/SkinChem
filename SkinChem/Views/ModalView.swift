//
//  ModalView.swift
//  TestApp
//
//  Created by India Poetzscher on 4/6/22.
//

import SwiftUI

struct ModalView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color.theme.background.edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        Text("How is your score calcualted?")
                            .font(Font.custom("Montserrat-Medium", size: 20, relativeTo: .title))
                            .lineLimit(nil)
                            .font(.title2)
                            .foregroundColor(Color.theme.secondAccent)
                        Spacer()
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "xmark")
                        }
                        .font(.title)
                        .foregroundColor(Color.theme.accent)
                    }
                    .padding(20)
                    VStack(alignment: .leading) {
                        Text("The SkinSafety score is a measure of the environment you live in as well as your personal choices and daily habits, both of which can impact your skin.")
                            .padding(.bottom, 5)
                            .fixedSize(horizontal: false, vertical: true)
                        Text("When you enter the city you live in, an API returns a pollution index which is an average of NO2, 03, PM10, and PM25, all of which are damaging.")
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.bottom, 5)
                        Text("Each toggle represents a lifestyle choice that can either be harmful or beneficial to your skin.")
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    .font(Font.custom("Montserrat-Medium", size: 16, relativeTo: .title))
                    .foregroundColor(Color.theme.thirdText)
                    .padding([.leading, .trailing, .bottom], 20)
                    .padding(.top, 4)
                    .lineLimit(nil)
                    Text("What does your score mean?")
                        .font(Font.custom("Montserrat-Medium", size: 20, relativeTo: .title))
                        .lineLimit(nil)
                        .font(.title2)
                        .foregroundColor(Color.theme.secondAccent)
                        .padding(20)
                    HStack(alignment: .firstTextBaseline) {
                        Image(systemName: "1.circle")
                            .font(.title2)
                            .foregroundColor(Color.theme.accent)
                        Text("Good:")
                            .font(Font.custom("Montserrat-Medium", size: 20, relativeTo: .title))
                            .foregroundColor(Color.theme.secondAccent)
                        Text("low pollution index & safe habits")
                            .font(Font.custom("Montserrat-Medium", size: 16, relativeTo: .title))
                            .foregroundColor(Color.theme.thirdText)
                            .lineLimit(nil)
                    }
                    
                    .padding([.leading, .trailing], 20)
                    .padding(.bottom, 8)
                    HStack {
                        Image(systemName: "2.circle")
                            .font(.title2)
                            .foregroundColor(Color.theme.accent)
                        Text("Fair")
                            .font(Font.custom("Montserrat-Medium", size: 20, relativeTo: .title))
                            .foregroundColor(Color.theme.secondAccent)
                    }
                    .padding([.leading, .trailing], 20)
                    .padding(.bottom, 8)
                    HStack(alignment: .firstTextBaseline) {
                        Image(systemName: "3.circle")
                            .font(.title2)
                            .foregroundColor(Color.theme.accent)
                        Text("Moderate:")
                            .font(Font.custom("Montserrat-Medium", size: 20, relativeTo: .title))
                            .foregroundColor(Color.theme.secondAccent)
                        Text("somewhere in the middle")
                            .font(Font.custom("Montserrat-Medium", size: 16, relativeTo: .title))
                            .foregroundColor(Color.theme.thirdText)
                            .lineLimit(nil)
                    }
                    .padding([.leading, .trailing], 20)
                    .padding(.bottom, 8)
                    HStack {
                        Image(systemName: "4.circle")
                            .font(.title2)
                            .foregroundColor(Color.theme.accent)
                        Text("Poor")
                            .font(Font.custom("Montserrat-Medium", size: 20, relativeTo: .title))
                            .foregroundColor(Color.theme.secondAccent)
                    }
                    .padding([.leading, .trailing], 20)
                    .padding(.bottom, 8)
                    HStack(alignment: .firstTextBaseline) {
                        Image(systemName: "5.circle")
                            .font(.title2)
                            .foregroundColor(Color.theme.accent)
                        Text("Very Poor:")
                            .font(Font.custom("Montserrat-Medium", size: 20, relativeTo: .title))
                            .foregroundColor(Color.theme.secondAccent)
                        Text("high pollution index & harmful habits")
                            .font(Font.custom("Montserrat-Medium", size: 16, relativeTo: .title))
                            .foregroundColor(Color.theme.thirdText)
                            .lineLimit(nil)
                    }
                    .padding([.leading, .trailing], 20)
                    .padding(.bottom, 8)
                    Spacer()
                }
            }
        }
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView()
        //            .preferredColorScheme(.dark)
    }
}
