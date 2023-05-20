////
////  CalculatorView.swift
////  TestApp
////
////  Created by India Poetzscher on 4/4/22.
////
//
//import SwiftUI
//import CoreLocation
//
//
//struct CalculatorView: View {
//
//    //user inputs
//    @State var address: String = ""
//    @State var smoke: Bool = false
//    @State var suncreen: Bool = false
//    @State var manufacture: Bool = false
//    @State var quartz: Bool = false
//    @State var darkMode : Bool =  false
////    @State var userInfo: String = "hey"
//
//    //to show/hide the alert
//    @State private var showingAlert = false
//    @State private var alertTitle : String?
//    @State private var alertMessage: String?
//    @State private var showingModal = false
//
//    var body: some View {
//        NavigationView {
//            ZStack {
//                Color.theme.background.edgesIgnoringSafeArea(.all)
//                ScrollView {
//                    VStack(alignment: .leading, spacing: 10) {
//                        Text("Let’s calculate your approximate exposure to potential skin-damaging chemicals. ")
//                            .foregroundColor(Color.theme.secondAccent)
//                            .padding(.all)
//                        Button {
//                            showingModal.toggle()
//                        } label: {
//                            HStack {
////                                Text("How is the score calculated")
//                                Text("What does your score mean?")
//                                Image(systemName: "questionmark.circle")
//                            }
//                            .padding([.leading, .bottom, .trailing])
//                        }
//                        .sheet(isPresented: $showingModal) {
//                            ModalView()
//                        }
//                        VStack(spacing: 12) {
//                            TextField("", text: $address)
//                                .modifier(PlaceholderStyle(showPlaceHolder: address.isEmpty,
//                                                           placeholder: "What city do you live in?"))
//                                .foregroundColor(Color.theme.text)
//                                .padding(20)
//                                .background(Color.theme.secondBackground)
//                                .cornerRadius(20)
//                                .padding(.horizontal)
//                            Toggle("I wear sunscreen with >15 SPF daily", isOn: $suncreen)
//                                    .foregroundColor(Color.theme.text)
//                                    .padding(20)
//                                    .background(Color.theme.secondBackground)
//                                    .cornerRadius(20)
//                                    .padding(.horizontal)
//                                    .tint(Color.theme.accent.opacity(0.9))
//                            Toggle("I smoke cigarettes often", isOn: $smoke)
//                                .foregroundColor(Color.theme.text)
//                                .padding(20)
//                                .background(Color.theme.secondBackground)
//                                .cornerRadius(20)
//                                .padding(.horizontal)
//                                .tint(Color.theme.accent.opacity(0.9))
//                            Toggle("I have worked in chemical manufacturing plants", isOn: $manufacture)
//                                .foregroundColor(Color.theme.text)
//                                .padding(20)
//                                .background(Color.theme.secondBackground)
//                                .cornerRadius(20)
//                                .padding(.horizontal)
//                                .tint(Color.theme.accent.opacity(0.9))
//                            Toggle("I have worked with quartz", isOn: $quartz)
//                                .foregroundColor(Color.theme.text)
//                                .padding(20)
//                                .background(Color.theme.secondBackground)
//                                .cornerRadius(20)
//                                .padding(.horizontal)
//                                .tint(Color.theme.accent.opacity(0.9))
//                        }
//                        Spacer()
//                        Button(action: {
//                            makeAPICall()
//                        }) {
//                            Text("Calculate")
//                                .frame(maxWidth: .infinity)
//                                .frame(height: 50)
//                                .opacity(1.0)
//                                .padding(.all, 12.0)
//                                .foregroundColor(.white)
//                                .background(Color.theme.accent).opacity(0.9)
//                                .cornerRadius(40.0)
//                                .font(.title)
//                                .shadow(color: Color.theme.shadow, radius: 12, x: 0, y: 6)
////                                .shadow(radius: 4)
//                                .padding()
//                        }
//                        .opacity(0.8)
//                        Spacer()
//                    }
//                }
//                .navigationTitle("Calculate")
//                .navigationBarTitleTextColor(Color.theme.secondAccent)
//            }
//        }
//        .alert(isPresented: $showingAlert) {
//            Alert(title: Text(alertTitle ?? "Error message"),
//                  message: Text(alertMessage ?? "Entered address is not correct"),
//                  dismissButton: .default(Text("Dismiss")))
//        }
//    }
//
//    func makeAPICall() {
//        let geoCoder = CLGeocoder()
//
//            geoCoder.geocodeAddressString(address) { (placemarks, error) in
//                guard
//                    let placemarks = placemarks,
//                    let location = placemarks.first?.location
//                else {
//                    // handle no location found
//                    alertTitle = nil
//                    alertMessage = nil
//                    showingAlert = true
//
//                    return
//                }
//
//                // Use your location
//                Task {
//                    let (data, _) = try await URLSession.shared.data(from: URL(string:"http://api.openweathermap.org/data/2.5/air_pollution/forecast?lat=\(location.coordinate.latitude)&lon=\(location.coordinate.longitude)&appid=1ad841f490bb675cfae625ddfdde4cab")!)
//                        let decodedResponse = try? JSONDecoder().decode(Response.self, from: data)
//                    let index = decodedResponse?.list.first?.main.aqi
//                    calculateScore(apiScore: index!)
//                }
//            }
//    }
//
//    func calculateScore(apiScore: Int) {
//
//        var individualToggleScore = 0
//
//
//        //check suncreen
//        if !suncreen {
//            individualToggleScore += 1
//        } else {
//            individualToggleScore += 0
//        }
//
//        //check smoking
//        if smoke {
//            individualToggleScore += 1
//        }
//
//        //check manufacture
//        if manufacture {
//            individualToggleScore += 1
//        }
//
//        //check quartz
//        if quartz {
//            individualToggleScore += 1
//        }
//
//
//        let pollutionPercentage = Double(apiScore) / 5
//        print(pollutionPercentage)
//        let averagedToggleScore = Double(individualToggleScore) / Double(4)
//        print(averagedToggleScore)
//        let finalScore = (Double(pollutionPercentage) + averagedToggleScore) / 2
//        print(finalScore)
//
//
//
//    func returnUserPollution(apiScore: Int) -> String {
//        var userPollution: String = ""
//
//        switch apiScore {
//            case 0...1:
//                userPollution = "very few potentially skin-damaging pollutants."
//            case 2...3:
//                userPollution = "some potentially skin-damaging pollutants."
//            case 4...5:
//                userPollution = "You are exposed to a fair amount of potentially skin-damaging pollutants."
//            default:
//                userPollution = "You are exposed to a lot of potentially skin-damaging pollutants."
//        }
//
//        return userPollution
//    }
//
//
//    func returnUserSmoke(smoke: Bool) -> String {
//        var userSmoke: String = ""
//
//        if smoke {
//            userSmoke = "Smoking causes"
//        } else {
//            userSmoke = ""
//        }
//        return userSmoke
//    }
//
//    func returnUserSunscreen(suncreen: Bool) -> String {
//        var userSunscreen: String = ""
//
//        if !suncreen {
//            userSunscreen = "Not wearing sunscreen causes"
//        } else {
//            userSunscreen = ""
//        }
//        return userSunscreen
//    }
//
//
//    func returnUserManufacture(manufacture: Bool) -> String {
//        var userManufacture: String = ""
//
//        if manufacture {
//            userManufacture = "Working with these chemicals causes..."
//        } else {
//            userManufacture = ""
//        }
//        return userManufacture
//    }
//
//    func returnUserQuarz(quartz: Bool) -> String {
//        var userQuartz: String = ""
//
//        if quartz {
//            userQuartz = "Working with these chemicals causes..."
//        } else {
//            userQuartz = ""
//        }
//        return userQuartz
//    }
//
////        func mainMessage(quartz: Bool, manufacture: Bool) -> String {
////            let constantMessage: String = "= bad for your skin"
////            let quartzMessage: String = "quartz"
////            let manufactureMessage: String = "manufacture"
////            var arraySkin: [String] = []
////
////            if quartz {
////                arraySkin.append("\(quartzMessage)")
////            }
////
////            if manufacture {
////                arraySkin.append("\(manufactureMessage)")
////            }
////
////            let mainMessage: String = "\(arraySkin) \(constantMessage). "
////
////            return mainMessage
////        }
//
//
//        func bodyMessage(averagedToggleScore: Double, sunscreen: Bool, smoke: Bool, manufacture: Bool, quartz: Bool) -> String {
//            let restOfBodyMessage: String = "= bad for your skin"
//            var checkTogglesList: String = ""
//
//            if !suncreen {
//                checkTogglesList.append("not wearing suncreen;")
//            }
//
//            if smoke {
//                checkTogglesList.append("smoking cigarettes often; ")
//            }
//
//            if manufacture {
//                checkTogglesList.append("working in manufacturing; ")
//            }
//
//            if quartz {
//                checkTogglesList.append("working with quartz; ")
//            }
//
//
//            var bodyMessage: String = ""
//
//            if averagedToggleScore >= 0.25 {
//                bodyMessage = "\(checkTogglesList) \(restOfBodyMessage)"
//            } else {
//                bodyMessage = "Great job keeping your skin safe!"
//            }
//
//            return bodyMessage
//        }
//
//        func finalMessage(finalScore: Double) -> String {
//
//            var finalMessage: String = ""
//
//            if finalScore > 0.2 {
//                finalMessage = "Learn more about how to protect your skin on the Explore Page!"
//            } else {
//                finalMessage = "Learn more on the Explore Page!"
//            }
//            return finalMessage
//        }
//
//
//        alertTitle = "Safety Score: \(getScore(score: finalScore))"
//        alertMessage = "Living in \(address) exposes you to \(returnUserPollution(apiScore: apiScore))\n\(bodyMessage(averagedToggleScore: averagedToggleScore, sunscreen: suncreen, smoke: smoke, manufacture: manufacture, quartz: quartz))\n\(finalMessage(finalScore: finalScore))"
//        showingAlert = true
//    }
//
////    \(returnUserSunscreen(suncreen: suncreen)) \(returnUserSmoke(smoke: smoke))::: :::\(returnUserManufacture(manufacture: manufacture))\(returnUserQuarz(quartz: quartz))
//
//    func getScore(score: Double) -> String {
//
//        switch score {
//        case 0.0...0.2:
//            return "1 (Good)"
//        case 0.21...0.4:
//            return "2 (Fair)"
//        case 0.41...0.6:
//            return "3 (Moderate)"
//        case 0.61...0.8:
//            return "4 (Poor)"
//        default:
//            return "5 (Very Poor)";
//        }
//    }
//}
//
//
//struct CalculatorView_Previews: PreviewProvider {
//    static var previews: some View {
//        CalculatorView()
////            .preferredColorScheme(.dark)
//    }
//}
