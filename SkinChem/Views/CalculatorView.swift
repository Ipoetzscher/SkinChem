//
//  CalculatorView.swift
//  TestApp
//
//  Created by India Poetzscher on 4/4/22.
//

import SwiftUI
import CoreLocation



struct CalculatorView: View {
    
    @State private var isShareSheetShowing = false
    
    @StateObject var vm: CalculatorViewModel = .init()
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [
              .foregroundColor: UIColor.black,
              .font : UIFont(name:"Montserrat-Bold", size: 30)!]
//        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Montserrat-Bold", size: 30)!]
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.theme.background.edgesIgnoringSafeArea(.all)
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Determine your long-term skin risks. Select the buttons below which apply to you to get an accurate reading.")
                            .font(.custom(FontsManager.regular, size: 16))
                            .foregroundColor(Color.theme.secondAccent)
                            .padding(.horizontal, UIScreen.main.bounds.width * 0.05)
                            .padding(.top, 10)
                            .padding(.bottom)
                        Button {
                            vm.showingModal.toggle()
                        } label: {
                            HStack(spacing: 4) {
                                Text("What does your score mean")
                                    .font(.custom(FontsManager.medium, size: 16))
                                Image(systemName: "questionmark.circle")
                            }
                            .padding(.horizontal, UIScreen.main.bounds.width * 0.05)
                            .padding(.bottom, 5)
                        }
                        .sheet(isPresented: $vm.showingModal) {
                            ModalView()
                        }
                        VStack(spacing: 12) {
                            HStack(spacing: 20) {
                                Image("cathedral")
                                TextField("", text: $vm.address)
                                    .modifier(PlaceholderStyle(showPlaceHolder: vm.address.isEmpty, placeholder: "What city do you live in?"))
                            }
                            .padding()
                            .background(Color.theme.background3)
                            .overlay(RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.theme.thirdText, lineWidth: 0.5))
                            .padding(.horizontal, UIScreen.main.bounds.width * 0.05)
                            ToggleView(isOn: $vm.suncreen, label: "I wear sunscreen daily", imageName: "sunscreen")
                                .padding(.top, 8)
                            ToggleView(isOn: $vm.smoke, label: "I smoke cigarettes often", imageName: "cigarettes")
                                .padding(.top, 8)
                            ToggleView(isOn: $vm.tanning, label: "I often use tanning beds", imageName: "uvtan")
                                .padding(.top, 8)
                            ToggleView(isOn: $vm.traffic, label: "My neighborhood has traffic", imageName: "traffic-jam")
                                .padding(.top, 8)
                            ToggleView(isOn: $vm.manufacture, label: "I've worked in chemical  plants", imageName: "chemicals")
                                .padding(.top, 8)
                            ToggleView(isOn: $vm.fire, label: "I've been a firefighter", imageName: "fire")
                                .padding(.top, 8)
                            ToggleView(isOn: $vm.quartz, label: "I've worked with quartz", imageName: "quartz")
                                .padding(.top, 8)
                            
                        }
                        Spacer()
                        Button(action: {
                            Task {
                                do {
                                    try await vm.makeAPICall()
                                }
                                catch {
                                    print(error)
                                }
                            }
                        }) {
                            Text("Calculate")
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                                .padding(.vertical, 12)
                                .foregroundColor(.white)
                                .background(Color.theme.accent)                                .cornerRadius(10)
                            //                                .font(.title2)
                                .font(.custom(FontsManager.medium, size: 20))
                            //                                .shadow(color: Color.theme.shadow, radius: 12, x: 0, y: 6)
                                .padding(.horizontal, UIScreen.main.bounds.width * 0.05)
//                                .padding(.bottom, 8)
                        }
                        Spacer()
                    }
                }
//                .navigationTitle("Calculate")
//                .navigationBarTitleTextColor(Color.theme.secondAccent)
                .navigationBarTitle(Text("Calculate"), displayMode: .large)
            }
            .onAppear() {
                vm.address = ""
            }

        }
        .alert(isPresented: $vm.showingAlert) {
            Alert(title: Text(vm.alertTitle ?? "Error message"),
                  message: Text(vm.alertMessage ?? "Entered address is not correct"),
                  primaryButton: .default(Text("Got it!")),
                  secondaryButton: .default(Text("Share results"), action: {
                shareResult()
                print(vm.alertMessage ?? "error")
            }))
//                  dismissButton: .default(Text("Got it!")))
        }
    }
    
//    func share() {
//        guard let urlShare = URL(string: "\(vm.alertMessage)") else { return }
//            let activityVC = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
//               UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
//        }
    
    
    
    func shareResult() {
        
        
        
        isShareSheetShowing.toggle()
        //https://www.apple.com/app-store/
        let link = URL(string: "https://www.apple.com/app-store/")!
        let info = "My Skin \(vm.alertTitle!). Calculate yours now with SkinChem! \(link)"
        
        let av = UIActivityViewController(activityItems: [info], applicationActivities: nil)
        
        let scenes = UIApplication.shared.connectedScenes
           let windowScene = scenes.first as? UIWindowScene
        
        windowScene?.keyWindow?.rootViewController?.present(av, animated: true, completion: nil)

        
        //UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true, completion: nil)
        
        
//        UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true, completion: nil)

        
        
        /*
        if UIDevice.current.userInterfaceIdiom == .pad {
            av.popoverPresentationController?.sourceView = UIApplication.shared.windows.first
            av.popoverPresentationController?.sourceRect = CGRect(x: UIScreen.main.bounds.width / 2.1, y: UIScreen.main.bounds.height / 1.3, width: 200, height: 200)
        }*/
    }

}








struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
//                    .preferredColorScheme(.dark)
    }
}










//  If I am going to add more toggles:
//      1. Edit averagedToggleScore
//      2. Edit bodyMessage function
//      3. Edit "if averagedToggleScore >= 0.16" if statement


// Originals
// I wear sunscreen with >15 SPF daily
// "I smoke cigarettes often or inhale second-hand smoke"
// I've worked with quartz (construction, mining, ceramics/glass, etc)
