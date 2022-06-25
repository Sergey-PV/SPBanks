//
//  BankFacility.swift
//  SPBanks
//
//  Created by Sergey Parfentchik on 22.06.22.
//

import Foundation
import CoreLocation

struct BankFacility {
    let id: String
    let type: TypeOfBankFacility
    let geoLocation: CLLocation
    let name: String
    let address: String
    let availability: String
    let cards: String
    let currency: String
    let otherInfo: [AdditionalInfo]
}
