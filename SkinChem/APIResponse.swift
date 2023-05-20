//
//  APIResponse.swift
//  TestApp
//
//  Created by India Poetzscher on 4/5/22.
//

import Foundation

struct Response: Codable {
    let list: [Main]
}

struct Main: Codable {
    
    let main: AQI
}

struct AQI: Codable {
    
    let aqi: Int
}

struct SolarRadiationResponse: Codable {
    let coord: OpenWeatherCoordinate?
    let list: [OpenWeatherRadiation]
}

struct OpenWeatherCoordinate: Codable {
    let lon: Double?
    let lat: Double?
    
}

struct OpenWeatherRadiation: Codable {
    let radiation: OpenWeatherRadiationObject?
    let dt: Int?
}

struct OpenWeatherRadiationObject: Codable {
    let ghi: Double?
    let dni: Double?
    let dhi: Double?
    let ghi_cs: Double?
    let dni_cs: Double?
    let dhi_cs: Double?
}


//{
//  "coord": {
//    "lon": -114.6244,
//    "lat": 32.7243
//  },
//  "list": [
//    {
//      "radiation": {
//        "ghi": 206.68,
//        "dni": 2.27,
//        "dhi": 204.83,
//        "ghi_cs": 826.71,
//        "dni_cs": 885.47,
//        "dhi_cs": 114.93
//      },
//      "dt": 1618232400
//    }
//  ]
//}
