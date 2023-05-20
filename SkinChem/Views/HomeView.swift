//
//  HomeView.swift
//  TestApp
//
//  Created by India Poetzscher on 7/1/22.
//

import Combine
import SwiftUI
import CoreLocation
import Foundation

struct HomeView: View {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Montserrat-Bold", size: 35)!]
    }
    
    // Menu View
    @State var showMenu = false
    
//    @Binding var showMenu: Bool
    
    // Int(CGFloat(UIScreen.main.bounds.width * 0.6))
    
    @State private var contentSize: CGSize = .zero
    
    //Location
    @StateObject var deviceLocationService = DeviceLocationService.shared
    @State var tokens: Set<AnyCancellable> = []
    @State var coordinates: (lat: Double, lon: Double) = (0, 0)
    @StateObject var vm: PollutionModel = .init()
    
    //Pollution & Sun Score Cards
    var rawSunScore: Double {
        solarRadiation?.current.uvi ?? 0
    }
    @State var rawPollutionScore: Double = 0
    @State var riskText: String = "__"
    @State var riskTextSun: String = "__"
    @State var solarRadiation: SolarRadiationModel?
    
    //    @State private var value1: Double = 80.0
    @State var gradient1 = LinearGradient(
        gradient: Gradient(colors: [.yellow, .orange, .red, .purple]),
        startPoint: .leading,
        endPoint: .trailing
    )
    
    
    //Risk Score Card
    @State var combinedRiskScoreText: String = ""
    @State var rawRiskScore: Double = 0
    @State private var value: CGFloat = 0.0
    @State private var inputState: String = ""
    @State private var gradient = LinearGradient(
        gradient: Gradient(colors: [.red, .green, .blue]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
    

    
    
    var body: some View {
        
        //        let pollutionScoreProgressBar: Double = rawPollutionScore
        
        if UIScreen.screenHeight < 668 {
        NavigationView {
            ZStack {
                Color.theme.background.edgesIgnoringSafeArea(.all)
                ScrollView {
                    VStack(alignment: .leading, spacing: UIScreen.main.bounds.width * 0.08) {
                        /*HStack {
                            Image("menuBar")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: UIScreen.main.bounds.width * 0.1)
                            //                    .padding(.top, 5)
                        }*/
                        HStack {
                            Text("Good Morning!")
                                .font(.custom(FontsManager.bold, size: 35))
                                .lineLimit(nil)
                                .foregroundColor(Color.theme.secondAccent)
                            //                    .padding(.bottom, 20)
                            //                            .padding(.horizontal, 25)
                            Spacer()
                        }
                        VStack(spacing: UIScreen.main.bounds.width * 0.08) {
                            HStack(spacing: UIScreen.main.bounds.width * 0.05) {
                                /*HomeCardView1(score: rawSunScore, title: "UV Index", image: "sun", riskText: "High Risk")
                                HomeCardView1(score: rawPollutionScore, title: "Pollution", image: "earthpollution", riskText: "Medium Risk", gradient1: gradient1)*/
                                HomeCardView1b(score: rawSunScore, title: "UV Index", image: "sun", riskText: riskTextSun)
                                HomeCardView1(score: rawPollutionScore, title: "Pollution" , image: "earthpollution", riskText: riskText, gradient1: gradient1)
                            }
                            HomeCardView2(score: rawRiskScore, riskText: combinedRiskScoreText)
//                            Spacer()
                        }
                        
                        VStack(alignment: .leading) {
//                                                Button("click") {
//
//                                                }
                            //Text("Coordinates here:")
                            //Text("long: \(coordinates.lat) lat: \(coordinates.lon)")
                            Button(action: {
                        //    vm.makeSolarRadiationAPICall(location: CLLocation(latitude: coordinates.lat, longitude: coordinates.lon))
                                    print("\(type(of: self)):: \(self.rawPollutionScore) start")
                                    geSolarRadiation()
                                }) {
                                Text("")
                            }
                        }.onChange(of: coordinates.lat, perform: { newValue in
                            let currentLocation = CLLocation(latitude: coordinates.lat, longitude: coordinates.lon)
                            if let solarLocation = solarRadiation?.location, (currentLocation.distance(from: solarLocation) > 1000 || currentLocation.distance(from: solarLocation) < -1000) { //after a kilometer
                                geSolarRadiation()
                            } else if solarRadiation == nil{ // first time
                                geSolarRadiation()
                            }
                            
                        })
                        .onAppear {
                            observeCoordinateUpdates()
                            observeLocationAccessDenied()
                            deviceLocationService.requestLocationUpdates()
                        }
                        
                        
                        
                                            .padding(.horizontal, 25)
                        
                        /*
                                            VStack(alignment: .leading) {
//                                                Button("click") {
//
//                                                }
                                                Text("Coordinates here:")
                                                Text("long: \(coordinates.lat)")
                                                Text("lat: \(coordinates.lon)")
                                                Text("pollution index: ")
                                                Button(action: {
//                                                    vm.makeSolarRadiationAPICall(location: CLLocation(latitude: coordinates.lat, longitude: coordinates.lon))
                                                    print("\(type(of: self)):: \(self.rawPollutionScore) start")
                                                    Task {
                                                        do {
                                                            self.rawPollutionScore = Double(try await vm.displayPollution(coordinates: coordinates))
                                                            print("\(type(of: self)):: \(self.rawPollutionScore)")
                                                        }
                                                        catch {
                                                            print("\(type(of: self)):: \(error)")
                                                        }
                                                    }
                                                }) {
                                                    Text("**test button")
                                                }
                                            }
                                            .onAppear {
                                                observeCoordinateUpdates()
                                                observeLocationAccessDenied()
                                                deviceLocationService.requestLocationUpdates()
                                            }*/
                        Spacer()
                            .navigationBarItems(leading:
                                       HStack {
                                           Button(action: {
                                               withAnimation(.linear(duration: 0.1)) {
                                                   self.showMenu.toggle()
                                               }
                                           }) {
                                               Image("menuBar")
                                                   .font(.largeTitle)
                                           }.foregroundColor(.gray)
                                       })
                        
                        
                        
                    }
                    .padding(.horizontal, UIScreen.main.bounds.width * 0.05)
                    //        .frame(width: UIScreen.main.bounds.width-40, alignment: .center)
                    //        .frame(maxHeight: contentSize.height)
                    
                    
                    
                    
                }
                if self.showMenu {
                    VStack() {
                        //Spacer()
                        MenuView()
        //                            .frame(width: UIScreen.main.bounds.width * 0.8)
                            .navigationBarTitle(Text(""), displayMode: .large)
                            .transition(.move(edge: .leading))
                    }
                    
                }
            }
            
            
        }
        .onAppear() {
            self.showMenu = false
        }
        } else {
            NavigationView {
                ZStack {
                    Color.theme.background.edgesIgnoringSafeArea(.all)
                    VStack(alignment: .leading, spacing: UIScreen.main.bounds.height * 0.08) {
//                        Spacer()
//                            HStack {
//                                Image("menuBar")
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fit)
//                                    .frame(height: UIScreen.main.bounds.width * 0.1)
//                                //                    .padding(.top, 5)
//                            }
//                            HStack {
//                                Text("Good Morning!")
//                                    .font(.custom(FontsManager.bold, size: 35))
//                                    .lineLimit(nil)
//                                    .foregroundColor(Color.theme.secondAccent)
//                                //                    .padding(.bottom, 20)
//                                //                            .padding(.horizontal, 25)
                               // Spacer()
//                            }
                            VStack(spacing: UIScreen.main.bounds.height * 0.025) {
                                HStack(spacing: UIScreen.main.bounds.width * 0.04) {
                                    HomeCardView1b(score: rawSunScore, title: "UV Index", image: "sun", riskText: riskTextSun)
                                    HomeCardView1(score: rawPollutionScore, title: "Pollution" , image: "earthpollution", riskText: riskText, gradient1: gradient1)
                                }
                                .padding(.top, UIScreen.main.bounds.height * 0.04)
                                HomeCardView2(score: rawRiskScore, riskText: combinedRiskScoreText)
//                                Spacer()
                            }
                        VStack(alignment: .leading) {
//                                                Button("click") {
//
//                                                }
                            //Text("Coordinates here:")
                            //Text("long: \(coordinates.lat) lat: \(coordinates.lon)")
                            Button(action: {
                        //    vm.makeSolarRadiationAPICall(location: CLLocation(latitude: coordinates.lat, longitude: coordinates.lon))
                                    print("\(type(of: self)):: \(self.rawPollutionScore) start")
                                    geSolarRadiation()
                                }) {
                                Text("")
                            }
                        }.onChange(of: coordinates.lat, perform: { newValue in
                            let currentLocation = CLLocation(latitude: coordinates.lat, longitude: coordinates.lon)
                            if let solarLocation = solarRadiation?.location, (currentLocation.distance(from: solarLocation) > 1000 || currentLocation.distance(from: solarLocation) < -1000) { //after a kilometer
                                geSolarRadiation()
                            } else if solarRadiation == nil{ // first time
                                geSolarRadiation()
                            }
                            
                        })
                        .onAppear {
                            observeCoordinateUpdates()
                            observeLocationAccessDenied()
                            deviceLocationService.requestLocationUpdates()
                        }
                                .navigationBarItems(leading:
                                           HStack {
                                               Button(action: {
                                                   withAnimation(.linear(duration: 0.1)) {
                                                       self.showMenu.toggle()
                                                   }
                                               }) {
                                                   Image("menuBar")
                                                       .font(.largeTitle)
                                               }.foregroundColor(.gray)
                                           })
                        }
                        .padding(.horizontal, UIScreen.main.bounds.width * 0.06)
                        //        .frame(width: UIScreen.main.bounds.width-40, alignment: .center)
                        //        .frame(maxHeight: contentSize.height)
                        
                    if self.showMenu {
                        MenuView()
//                            .frame(width: UIScreen.main.bounds.width * 0.8)
                            .navigationBarTitle(Text(""), displayMode: .large)
                            .transition(.move(edge: .leading))
                    }
                        
                }.navigationBarTitle(Text("Good \(morningAfternoonNight(time: HomeView.currentTime()))!"), displayMode: .large)
            }
            .onAppear() {
                self.showMenu = false
            }

        }
        
        
        //        .padding(.horizontal, 25)
        //        .padding(.vertical)
        //        .background(Color.theme.accent)
        //            .navigationBarTitleDisplayMode(.inline)
        //            .navigationTitle("Good Morning, India")
        //            .navigationBarTitleTextColor(Color.theme.secondAccent)
        //            .navigationViewStyle(.stack)
        //        }
    }
    
    func geSolarRadiation(){
        Task {
            do {
                self.rawPollutionScore = Double(try await vm.displayPollution(coordinates: coordinates))
                self.riskText = getRiskText(score: rawPollutionScore)
                self.solarRadiation = try await self.vm.makeSolarRadiationAPICall(coordinates: coordinates)
                print("\(type(of: self)):: updatebutton ::\(self.rawSunScore)")
                self.rawRiskScore = getTotalRiskScore(score: rawPollutionScore, sunScore: rawSunScore)
                print("\(type(of: self)):: \(self.rawPollutionScore)")
                self.combinedRiskScoreText = getCombinedRiskScoreText(score: rawRiskScore)
                self.riskTextSun = getRiskTextSun(score: rawSunScore)

            }
            catch {
                print("\(type(of: self)):: \(error)")
            }
        }
    }
    
    // switch on pollution score from API
    func getRiskText(score: Double) -> String {
        switch score {
        case 0.0...2.0:
            return "Low risk"
        case 2.0...3.0:
            return "Medium risk"
        case 3.0...4.0:
            return "High risk"
        case 4.0...5.0:
            return "Very risky"
        default:
            return "oustide range";
        }
    }
    
    func getRiskTextSun(score: Double) -> String {
        switch score {
        case 0.0...3.0:
            return "Low risk"
        case 3.0...6.0:
            return "Medium risk"
        case 6.0...9.0:
            return "High risk"
        case 9.0...12.0:
            return "Very risky"
        default:
            return "outside range";
        }
    }
    
    // get total risk score (circle display)
    func getTotalRiskScore(score: Double, sunScore: Double) -> Double {
        var pollutionScorePercentage: Double = 0.0
        var sunScorePercentage: Double = 0.0
        var totalRiskScore: Double
        sunScorePercentage = sunScore * Double(100/12)
        
        switch score {
        case 0.0...1.0:
            pollutionScorePercentage = 20
        case 1.0...2.0:
            pollutionScorePercentage = 40
        case 3.0...4.0:
            pollutionScorePercentage = 60
        case 4.0...5.0:
            pollutionScorePercentage = 80
        default:
            pollutionScorePercentage = 100
        }
        
        totalRiskScore = (pollutionScorePercentage + sunScorePercentage) / 2
        return totalRiskScore
    }
    
    func getCombinedRiskScoreText(score: Double) -> String {
        switch score {
        case 0.0...25.0:
            return "Today's conditions are quite safe! Enjoy the day!"
        case 25.0...50.0:
            return "Today's conditions are quite risky! Take precautions and be consious about your exposure."
        case 50.0...75.0:
            return "Today's conditions are risky! Take precautions and be consious about your exposure."
        case 75.0...100.0:
            return "Today's conditions are very risk! It is best to stay inside or take precautions."
        default:
            return "Extremely unsafe";
        }
    }
    
    static func currentTime() -> Double {
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        _ = calendar.component(.minute, from: date)
        return Double(hour)
    }
    
    func morningAfternoonNight(time: Double) -> String {
        switch time {
        case 3.0...12.0:
            return "Morning"
        case 12.0...17.0:
            return "Afternoon"
        case 17.0...24.0:
            return "Evening"
        default:
            return "Evening"
        }
        
    }

    
    func observeCoordinateUpdates() {
        deviceLocationService.coordinatesPublisher
            .receive(on: DispatchQueue.main)
            .sink { completion in
                if case .failure(let error) = completion {
                    print(error)
                }
            } receiveValue: { coordinates in
                self.coordinates = (coordinates.latitude, coordinates.longitude)
            }
            .store(in: &tokens)
    }
    
    func observeLocationAccessDenied() {
        deviceLocationService.deniedLocationAccessPublisher
            .receive(on: DispatchQueue.main)
            .sink {
                print("alert to the user")
            }
            .store(in: &tokens)
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
        HomeView()
            .previewDevice("iPhone 11")
        HomeView()
            .previewDevice("iPhone SE (3rd generation)")
        //            .preferredColorScheme(.dark)
    }
}
