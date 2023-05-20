//
//  Resources.swift
//  TestApp
//
//  Created by India Poetzscher on 4/4/22.
//

import SwiftUI

struct ResourcesView: View {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Montserrat-Bold", size: 30)!]
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Color.theme.background.edgesIgnoringSafeArea(.all)
                    //                Spacer()
                    VStack {
                        List {
                            //                    Spacer()
                            Section(header: Text("Want to learn more?").font(Font.custom("Montserrat-Bold", size: 20, relativeTo: .title)).padding(-20).foregroundColor(Color.theme.secondAccent)){
                                ForEach(secondResources) {
                                    item in
                                    ResourceItemsView2(secondResource: item)
                                }
                            }
                            .padding([.leading, .trailing],13)
                            .padding([.top, .bottom], 13)
                            .listRowBackground(Color.theme.secondBackground)
                            .foregroundColor(Color.theme.secondAccent)
                            Section(header: Text("Why is this topic important?").font(Font.custom("Montserrat-Bold", size: 20, relativeTo: .title)).padding(-20).foregroundColor(Color.theme.secondAccent)){
                                ForEach(thirdResources) {
                                    item in
                                    ResourceItemsView3(thirdResource: item)
                                }
                            }
                            .padding([.leading, .trailing],13)
                            .padding([.top, .bottom], 13)
                            .listRowBackground(Color.theme.secondBackground)
                            .foregroundColor(Color.theme.secondAccent)
                            Section(header: Text("Sources Used").font(Font.custom("Montserrat-Bold", size: 20, relativeTo: .title)).padding(-20).foregroundColor(Color.theme.secondAccent)){
                                ForEach(resources) {
                                    item in
                                    ResourceItemsView(resource: item)
                                }
                            }
                            .padding([.leading, .trailing],13)
                            .padding([.top, .bottom], 13)
                            .listRowBackground(Color.theme.secondBackground)
                            .foregroundColor(Color.theme.secondAccent)
                            
                        }
                        //                .listStyle(.plain)
                        //                .padding(.top)
                        //                .background(Color.theme.background.ignoresSafeArea())
                        .onAppear {
                            UITableView.appearance().backgroundColor = .clear
                        }
//                        .navigationTitle("Resources")                .navigationBarTitleTextColor(Color.theme.secondAccent)
                        .navigationBarTitle(Text("Resources"), displayMode: .large)
                    }
                    
                }
            }
        }
    }
}

struct Resources_Previews: PreviewProvider {
    static var previews: some View {
        ResourcesView()
        //            .preferredColorScheme(.dark)
    }
}
