//
//  CalculatorViewModel.swift
//  TestApp
//
//  Created by India Poetzscher on 5/15/22.
//

import SwiftUI
import CoreLocation
@MainActor
class CalculatorViewModel: ObservableObject {
    
    //user inputs
    @Published var address: String = ""
    @Published var smoke: Bool = false
    @Published var suncreen: Bool = false
    @Published var manufacture: Bool = false
    @Published var quartz: Bool = false
    @Published var tanning: Bool = false
    @Published var traffic: Bool = false
    @Published var fire: Bool = false
    @Published var darkMode : Bool =  false
    
    //to show/hide the alert
    @Published var showingAlert = false
    @Published var alertTitle : String?
    @Published var alertMessage: String?
    @Published var showingModal = false
    
    func getCoordinate(address: String) async throws -> CLLocation {
        let geoCoder = CLGeocoder()
        
        typealias Continuation = CheckedContinuation < CLLocation, Error >
        return try await withCheckedThrowingContinuation({ (continuation: Continuation) in
        
        geoCoder.geocodeAddressString(address) { [self] (placemarks, error) in
            if let error = error {
                continuation.resume(throwing: error)
            } else if let location = placemarks?.first?.location {
                continuation.resume(returning: location)
            } else {
                continuation.resume(throwing: AppError.unknown)
            }
            
//            guard
//                let placemarks = placemarks,
//                let location = placemarks.first?.location
//            else {
//                // handle no location found
//                alertTitle = nil
//                alertMessage = nil
//                showingAlert = true
//
//                return
//            }
            
        }
        })
    }
    
    func makeAPICall() async throws {
        
//        let geoCoder = CLGeocoder()
//
//        geoCoder.geocodeAddressString(address) { [self] (placemarks, error) in
//            guard
//                let placemarks = placemarks,
//                let location = placemarks.first?.location
//            else {
//                // handle no location found
//                alertTitle = nil
//                alertMessage = nil
//                showingAlert = true
//
//                return
//            }
            
//            old api key: 5aff504a7371f74d4a1a712c5887b745
            
            // Use your location
//            Task {
        let location = try await getCoordinate(address: address)
                let (data, _) = try await URLSession.shared.data(from: URL(string:"http://api.openweathermap.org/data/2.5/air_pollution/forecast?lat=\(location.coordinate.latitude)&lon=\(location.coordinate.longitude)&appid=1ad841f490bb675cfae625ddfdde4cab")!)
                let decodedResponse = try JSONDecoder().decode(Response.self, from: data)
                let index = decodedResponse.list.first?.main.aqi
                calculateScore(apiScore: index!)
//            }
//        }
    }
    
    
    
    
    func calculateScore(apiScore: Int) {
        var individualToggleScore = 0
        
        //check suncreen
        if !suncreen {
            individualToggleScore += 1
        } else {
            individualToggleScore += 0
        }
        //check smoking
        if smoke {
            individualToggleScore += 1
        }
        //check tanning
        if tanning {
            individualToggleScore += 1
        }
        //check traffic
        if traffic {
            individualToggleScore += 1
        }
        //check manufacture
        if manufacture {
            individualToggleScore += 1
        }
        //check quartz
        if quartz {
            individualToggleScore += 1
        }
        
        if fire {
            individualToggleScore += 1
        }
        
        let pollutionPercentage = Double(apiScore) / 5
        print(pollutionPercentage)
        let averagedToggleScore = Double(individualToggleScore) / Double(7)
        print(averagedToggleScore)
        let finalScore = (Double(pollutionPercentage) + averagedToggleScore) / 2
        print(finalScore)
        
        
        func returnUserPollution(apiScore: Int) -> String {
            var userPollution: String = ""
            
            switch apiScore {
            case 0...1:
                userPollution = "very few potentially skin-damaging pollutants."
            case 2...3:
                userPollution = "some potentially skin-damaging pollutants."
            case 4...5:
                userPollution = "a fair amount of potentially skin-damaging pollutants."
            default:
                userPollution = "a lot of potentially skin-damaging pollutants."
            }
            
            return userPollution
        }
        
        
        
        func bodyMessage(averagedToggleScore: Double, sunscreen: Bool, smoke: Bool, manufacture: Bool, quartz: Bool) -> String {
            var operand = ""
            let restOfBodyMessage: String = "bad for your skin"
            var checkTogglesList: [String] = [""]
            
            
            var totalCount = 0;
            if !suncreen {
                checkTogglesList.append("Not wearing suncreen")
                totalCount += 1
            }
            
            if smoke {
                if totalCount == 0 {
                    checkTogglesList.append("Cigarette smoke")
                }
                else {
                    checkTogglesList.append("cigarette smoke")
                }
                totalCount += 1
            }
            
            if tanning {
                if totalCount == 0 {
                    checkTogglesList.append("Using tanning beds often")
                }
                else {
                    checkTogglesList.append("using tanning beds often")
                }
                totalCount += 1
            }
            
            if traffic {
                if totalCount == 0 {
                    checkTogglesList.append("Regular expsoure to heavy traffic")
                }
                else {
                    checkTogglesList.append("regular expsoure to heavy traffic")
                }
                totalCount += 1
            }
            
            if manufacture {
                if totalCount == 0 {
                    checkTogglesList.append("Working in chemical manufacturing")
                }
                else {
                    checkTogglesList.append("working in chemical manufacturing")
                }
                totalCount += 1
            }
            
            if quartz {
                if totalCount == 0 {
                    checkTogglesList.append("Quartz")
                }
                else {
                    checkTogglesList.append("quartz")
                }
                totalCount += 1
            }
            
            if fire {
                if totalCount == 0 {
                    checkTogglesList.append("Firefighting")
                }
                else {
                    checkTogglesList.append("firefighting")
                }
                totalCount += 1
            }
            
            
            if totalCount >= 3 {
                operand = "are all"
            }
            else if totalCount == 2 {
                operand = "are"
            }
            else if totalCount == 1 {
                operand = "is"
            }
            
            var messageOutput: String = ""
            
            for (index, value) in checkTogglesList.enumerated() {
                if (totalCount >= 2) {
                    if (index == (totalCount - 1)) {
                        let altered: String = "\(value) \("and ")"
                        messageOutput.append(altered)
                    }
                    else if (index == (totalCount)) {
                        let altered: String = "\(value)"
                        messageOutput.append(altered)
                    }
                    else if (index != 0) {
                        let altered: String = "\(value), "
                        messageOutput.append(altered)
                    }
                }
                else {
                    let altered: String = "\(value)"
                    messageOutput.append(altered)
                }
                
            }
            
            var bodyMessage: String = ""
            
            if averagedToggleScore >= 0.15 {
                bodyMessage = "\(messageOutput) \(operand) \(restOfBodyMessage)."
            } else {
                bodyMessage = "Great job keeping your skin safe!"
            }
            
            return bodyMessage
        }
        
        func finalMessage(finalScore: Double) -> String {
            
            var finalMessage: String = ""
            
            if finalScore > 0.2 {
                finalMessage = "Learn more about how to protect your skin on the Explore Page!"
            } else {
                finalMessage = "Learn more on the Explore Page."
            }
            return finalMessage
        }
        
        func getScore(score: Double) -> String {
            
            switch score {
            case 0.0...0.2:
                return "1 (Good)"
            case 0.2...0.4:
                return "2 (Fair)"
            case 0.4...0.6:
                return "3 (Moderate)"
            case 0.6...0.8:
                return "4 (Poor)"
            default:
                return "5 (Very Poor)";
            }
        }
        
        alertTitle = "Safety Score: \(getScore(score: finalScore))"
        alertMessage = "Living in \(address) exposes you to \(returnUserPollution(apiScore: apiScore))\n\(bodyMessage(averagedToggleScore: averagedToggleScore, sunscreen: suncreen, smoke: smoke, manufacture: manufacture, quartz: quartz))\n\(finalMessage(finalScore: finalScore))"
        showingAlert = true
    }
}
