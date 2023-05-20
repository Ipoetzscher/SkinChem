//
//  HomePage.swift
//  TestApp
//
//  Created by India Poetzscher on 4/2/22.
//

import SwiftUI

struct ExploreView: View {
    
    
    
    @State var showDiseasesOnly: Bool = false
    //    @State var showChemicalsOnly: Bool = true
    
    var item: Item = items[2]
    var filtered: [Item] {
        items.filter { item in
            if showDiseasesOnly && item.isDisease {
                return true
            } else if !showDiseasesOnly && !item.isDisease {
                return true
            } else {
                return false
            }
        }
    }
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Montserrat-Bold", size: 30)!]
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.theme.background.edgesIgnoringSafeArea(.all)
                ScrollView {
                    VStack(spacing: 2) {
                        VStack(alignment: .leading, spacing: 7) {
                            Text("Understand how environmental chemicals impact your skin")
                            //                                    .font(.title2)
                            //                                    .fontWeight(.regular)
                                .font(Font.custom("Montserrat-Medium", size: 20, relativeTo: .title))
                                .lineSpacing(-30)
                                .tint(Color.theme.accent.opacity(0.9))
                                .foregroundColor(Color.theme.secondAccent)
                            //                                    .padding([.leading, .bottom, .trailing], 20)
                            Spacer()
                            Toggle("Explore by Skin Disease", isOn: $showDiseasesOnly)
                                .tint(Color.theme.accent.opacity(0.9))
                                .font(.custom(FontsManager.regular, size: 16))
                            //                                    .padding([.leading, .trailing], 20)
                                .foregroundColor(Color.theme.thirdText)
                            //                                    .shadow(radius: 1)
                        }
                        //                            .padding([.leading, .trailing])
                        VStack(spacing: 3) {
                            ForEach(filtered) {
                                item in
                                CardView(item: item)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                //                                        .padding(.horizontal)
                                    .padding(.vertical, 9)
                                //                                            .padding([.top, .leading, .trailing])
                            }
                        }
                        //                            .padding(11)
                    }
                    .padding(.horizontal, UIScreen.main.bounds.width * 0.05)
                }
//                .navigationTitle("SkinChem")
//                .navigationBarTitleTextColor(Color.theme.secondAccent)
                .navigationBarTitle(Text("SkinChem"), displayMode: .large)
            }
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}




