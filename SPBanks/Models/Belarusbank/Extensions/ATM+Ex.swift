//
//  ATM+Ex.swift
//  SPBanks
//
//  Created by Sergey Parfentchik on 27.06.22.
//

import Foundation
import CoreLocation

// MARK: - Constants
private struct ConstantString {
    static let prefixId = "BelarusbankATM"
    static let name = "ATM"
}

extension BelarusbankATM.DataClass.ATM {
    
    // MARK: - Public methods
    func getId() -> String {
        "\(ConstantString.prefixId)_\(atmID)"
    }
    
    func getType() -> TypeOfBankFacility {
        .atm
    }
    
    func getGeoLocation() -> CLLocation {
        CLLocation(latitude: address.geolocation.geographicCoordinates.latitude,
                   longitude: address.geolocation.geographicCoordinates.longitude)
    }
    
    func getName() -> String {
        ConstantString.name
    }
    
    func getAddress() -> String {
        var fullAddress = address.townName
        if !fullAddress.isEmpty && !address.streetName.isEmpty {
            fullAddress += ", " + address.streetName
        }
        if !fullAddress.isEmpty && !address.buildingNumber.isEmpty {
            fullAddress += ", " + address.buildingNumber
        }
        return fullAddress
    }
    
    func getAvailability() -> String {
        // MARK: - Fix
        ""
    }

    func getCards() -> String {
        cards.joined(separator: ", ")
    }
    
    func getCurrency() -> String {
        currency
    }

    func getOtherInfo() -> [OtherInfo] {
        // MARK: - Fix
        []
    }
    
}
