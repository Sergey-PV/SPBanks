//
//  CLLocation+Ex.swift
//  SPBanks
//
//  Created by Sergey Parfentchik on 26.06.22.
//

import Foundation
import CoreLocation

extension CLLocation {
    convenience init(latitude: String, longitude: String) {
        let latitudeDouble = Double(latitude) != nil ? Double(latitude)! : 0
        let longitudeDouble = Double(longitude) != nil ? Double(longitude)! : 0
        self.init(latitude: latitudeDouble, longitude: longitudeDouble)
    }
}
