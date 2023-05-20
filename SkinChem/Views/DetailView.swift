//
//  DetailView3.swift
//  TestApp
//
//  Created by India Poetzscher on 4/5/22.
//

import SwiftUI

struct DetailView: View {
    
    var item: Item
    init(item: Item){
        self.item = item
        //Put line here
        let tabBarAppearance = UITabBar.appearance()
        tabBarAppearance.isTranslucent = false
        tabBarAppearance.barTintColor = UIColor.systemBackground
        tabBarAppearance.backgroundColor = UIColor.systemBackground
        //        if #available(iOS 15.0, *) {
        //                    let tabBarAppearance = UITabBarAppearance()
        //                    tabBarAppearance.configureWithDefaultBackground()
        //                    tabBarAppearance.backgroundColor = UIColor.systemBackground
        //                    UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        //                    UITabBar.appearance().standardAppearance = tabBarAppearance
        //                    UITabBar.appearance().isTranslucent = false
        //                }
    }
    var body: some View {
        ZStack {
            Color.theme.background.edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack(alignment: .leading) {
                    VStack(alignment: .leading, spacing: 12) {
                        // for all
                        if item.capitalize {
                            Text("What \(item.plural) \(item.shortened)?")
                                .font(.title2)
                                .foregroundColor(Color.theme.secondAccent)
                        } else {
                            Text("What \(item.plural) \(item.shortened.lowercased())?")
                                .font(.title2)
                                .foregroundColor(Color.theme.secondAccent)
                        }
                        Text(item.previewText)
                            .foregroundColor(Color.theme.thirdText)
                            .font(.body)
                            .lineLimit(nil)
                    }.padding(20)
                    VStack(alignment: .leading, spacing: 12) {
                        if let diseaseQuestion1 = item.diseasesQuestion1 {
                            VStack(alignment: .leading, spacing: 12) {
                                Text("\(diseaseQuestion1)")
                                    .font(.title2)
                                    .foregroundColor(Color.theme.secondAccent)
                                Text("\(item.diseasesAnswer1)")
                                    .foregroundColor(Color.theme.thirdText)
                                    .font(.body)
                                    .lineLimit(nil)
                            }
                        }
                    }.padding([.leading, .trailing, .bottom], 20)
                    VStack(alignment: .leading, spacing: 12) {
                        if let chemicalsQuestion1 = item.chemicalsQuestion1 {
                            VStack(alignment: .leading, spacing: 12) {
                                Text("\(chemicalsQuestion1)")
                                    .font(.title2)
                                //                                    .shadow(color: Color.theme.secondShadow, radius: 12, x: 0, y: 5)
                                    .foregroundColor(Color.theme.secondAccent)
                                Text("\(item.chemicalsAnswer1)")
                                    .foregroundColor(Color.theme.thirdText)
                                    .font(.body)
                                    .lineLimit(nil)
                            }
                        }
                    }.padding([.leading, .trailing], 20)
                    VStack(alignment: .leading, spacing: 12) {
                        if let diseasesQuestion2 = item.diseasesQuestion2 {
                            VStack(alignment: .leading, spacing: 12) {
                                Text("\(diseasesQuestion2)")
                                    .font(.title2)
                                //                                    .shadow(color: Color.theme.secondShadow, radius: 12, x: 0, y: 5)
                                    .foregroundColor(Color.theme.secondAccent)
                                Text("\(item.diseasesAnswer2)")
                                    .foregroundColor(Color.theme.thirdText)
                                    .font(.body)
                                    .lineLimit(nil)
                            }
                        }
                    }.padding([.leading, .trailing], 20)
                    
                    VStack(spacing: 200) {
                        /*
                        HStack {
                            //Spacer()
                            if let imagename = item.image {
                                GeometryReader { geo in
                                    Image(imagename)
                                        .resizable()
                                        .scaledToFit()
                                    //                                    .padding(.vertical)
                                        .frame(width: UIScreen.main.bounds.width * 1, height: 200, alignment: .center)
                                    //                                    .frame(height: geo.size.width * 0.6)
                                    //                                    .frame(width: geo.size.width)
                                    
                                }
                                

                            }
                            Spacer()
                            
                        }*/
                        
                        
                        Text(" ")
                    }
                    .padding(.top)
                    .navigationTitle(item.shortened).lineLimit(2)
                    .navigationBarTitleTextColor(Color.theme.secondAccent)
                }
            }
        }
    }
}

struct DetailView3_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(item: .sample)
    }
}
