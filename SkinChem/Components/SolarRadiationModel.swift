//
//  SolarRadiationModel.swift
//  TestApp
//
//  Created by India Poetzscher on 10/27/22.
//

import Foundation
import MapKit
struct SolarRadiationModel: Codable{
    var lat: Double
    var lon: Double
    var current: SolarRadiationCurrent
    var location: CLLocation{
        .init(latitude: lat, longitude: lon)
    }

}
struct SolarRadiationCurrent: Codable{
    var uvi: Double
}
