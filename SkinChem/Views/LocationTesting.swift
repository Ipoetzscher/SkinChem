//
//  LocationTesting.swift
//  TestApp
//
//  Created by India Poetzscher on 7/2/22.
//

//import SwiftUI
//
//import CoreLocation
//import CoreLocationUI
//
//class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
//    let manager = CLLocationManager()
//
//    @Published var location: CLLocationCoordinate2D?
//
//    override init() {
//        super.init()
//        manager.delegate = self
//    }
//
//    func requestLocation() {
//        manager.requestLocation()
//    }
//
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        location = locations.first?.coordinate
//    }
//}
//
//struct LocationTesting: View {
//    @StateObject var locationManager = LocationManager()
//
//    var body: some View {
//        VStack {
//            if let location = locationManager.location {
//                Text("Your location: \(location.latitude), \(location.longitude)")
//            }
//
//            LocationButton(.shareMyCurrentLocation) {
//                locationManager.requestLocation()
//            }
//            .frame(height: 44)
//            .padding()
//        }
//    }
//}
//
//struct LocationTesting_Previews: PreviewProvider {
//    static var previews: some View {
//        LocationTesting()
//    }
//}
