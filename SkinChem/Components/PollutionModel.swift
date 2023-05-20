//
//  Pollution.swift
//  TestApp
//
//  Created by India Poetzscher on 7/2/22.
//


import SwiftUI
import CoreLocation
class PollutionModel: ObservableObject {
    
    //user inputs
//    @Published var address: String = ""
//    @Published var smoke: Bool = false
//    @Published var suncreen: Bool = false
//    @Published var manufacture: Bool = false
//    @Published var quartz: Bool = false
//    @Published var tanning: Bool = false
//    @Published var traffic: Bool = false
//    @Published var darkMode : Bool =  false
    //@Published var coordinates: (lat: Double, lon: Double) = (0, 0)
    
    //to show/hide the alert
//    @Published var showingAlert = false
//    @Published var alertTitle : String?
//    @Published var alertMessage: String?
//    @Published var showingModal = false
    
    func displayPollution(coordinates: (lat: Double, lon: Double)) async throws -> Int {

                let (data, _) = try await URLSession.shared.data(from: URL(string:"http://api.openweathermap.org/data/2.5/air_pollution/forecast?lat=\(coordinates.lat)&lon=\(coordinates.lon)&appid=1ad841f490bb675cfae625ddfdde4cab")!)
                let decodedResponse = try? JSONDecoder().decode(Response.self, from: data)
                return decodedResponse?.list.first?.main.aqi ?? 0

    }
    
    func makeAPICall2(coordinates: (lat: Double, lon: Double)) {
//        let geoCoder = CLGeocoder()
//
//        geoCoder.geocodeAddressString(address) { [self] (placemarks, error) in
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

                // Use your location
                Task {
                    let (data, _) = try await URLSession.shared.data(from: URL(string:"http://api.openweathermap.org/data/2.5/air_pollution/forecast?lat=\(coordinates.lat)&lon=\(coordinates.lon)&appid=1ad841f490bb675cfae625ddfdde4cab")!)
                        let decodedResponse = try? JSONDecoder().decode(Response.self, from: data)
                    let index = decodedResponse?.list.first?.main.aqi
                    returnScore(apiScore: index!, coordinates: coordinates)
//                }
            }
    }
    
    func makeSolarRadiationAPICall(coordinates: (lat: Double, lon: Double)) async throws -> SolarRadiationModel {
        
            
//            let (data, _) = try await URLSession.shared.data(from: URL(string:"http://api.openweathermap.org/data/2.5/solar_radiation?lat=\(location.coordinate.latitude)&lon=\(location.coordinate.longitude)&appid=5aff504a7371f74d4a1a712c5887b745")!)
                let (data, _) = try await URLSession.shared.data(from: URL(string:"http://api.openweathermap.org/data/3.0/onecall?lat=\(coordinates.lat)&lon=\(coordinates.lon)&appid=a32fbe05e71bf1b600ea3b17a187a47e")!)
                print(String(data: data, encoding: .utf8))
                let decoder = JSONDecoder()
                return try decoder.decode(SolarRadiationModel.self, from: data)
                //let decodedResponse = try JSONDecoder().decode(SolarRadiationResponse.self, from: data)
                //print(decodedResponse)
            

        
    }

    
    
    func returnScore(apiScore: Int, coordinates: (lat: Double, lon: Double)) -> String {
        let locData = "hello testing \(apiScore) + \(coordinates.lat) + \(coordinates.lon)"
        let sample = String(apiScore + 5)
        let output = String(sample + locData)
        
        return String(output)
    }
}


//struct Pollution: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)`
//    }
//}
//
//struct Pollution_Previews: PreviewProvider {
//    static var previews: some View {
//        Pollution()
//    }
//}

