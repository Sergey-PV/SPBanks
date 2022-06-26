//
//  BelarusbankATM.swift
//  SPBanks
//
//  Created by Sergey Parfentchik on 13.06.22.
//

import Foundation
import CoreLocation

// MARK: - Constants
private struct ConstantString {
    static let prefixId = "BelarusbankATM"
}

// MARK: - BelarusbankATM
class BelarusbankATM: Codable {

    var data = DataClass.init(atm: [])

    enum CodingKeys: String, CodingKey {
        case data = "Data"
    }

    // MARK: - DataClass
    struct DataClass: Codable {
        var atm: [ATM]

        enum CodingKeys: String, CodingKey {
            case atm = "ATM"
        }

        // MARK: - ATM
        class ATM: Codable {
            let atmID, type, baseCurrency, currency: String
            let cards: [String]
            let currentStatus: String
            let address: Address
            let services: [Service]
            let availability: Availability
            let contactDetails: ContactDetails

            enum CodingKeys: String, CodingKey {
                case atmID = "atmId"
                case type, baseCurrency, currency, cards, currentStatus
                case address = "Address"
                case services = "Services"
                case availability = "Availability"
                case contactDetails = "ContactDetails"
            }
        }

        // MARK: - Address
        struct Address: Codable {
            let streetName, buildingNumber, townName, countrySubDivision: String
            let country, addressLine, addressDescription: String
            let geolocation: Geolocation

            enum CodingKeys: String, CodingKey {
                case streetName, buildingNumber, townName, countrySubDivision, country, addressLine
                case addressDescription = "description"
                case geolocation = "Geolocation"
            }
        }

        // MARK: - Geolocation
        struct Geolocation: Codable {
            let geographicCoordinates: GeographicCoordinates

            enum CodingKeys: String, CodingKey {
                case geographicCoordinates = "GeographicCoordinates"
            }
        }

        // MARK: - GeographicCoordinates
        struct GeographicCoordinates: Codable {
            let latitude, longitude: String
        }

        // MARK: - Availability
        struct Availability: Codable {
            let access24Hours, isRestricted, sameAsOrganization: Bool
            let standardAvailability: StandardAvailability

            enum CodingKeys: String, CodingKey {
                case access24Hours, isRestricted, sameAsOrganization
                case standardAvailability = "StandardAvailability"
            }
        }

        // MARK: - StandardAvailability
        struct StandardAvailability: Codable {
            let day: [Day]

            enum CodingKeys: String, CodingKey {
                case day = "Day"
            }
        }

        // MARK: - Day
        struct Day: Codable {
            let dayCode, openingTime, closingTime: String
            let dayBreak: Break

            enum CodingKeys: String, CodingKey {
                case dayCode, openingTime, closingTime
                case dayBreak = "Break"
            }
        }

        // MARK: - Break
        struct Break: Codable {
            let breakFromTime, breakToTime: String
        }

        // MARK: - ContactDetails
        struct ContactDetails: Codable {
            let phoneNumber: String
        }

        // MARK: - Service
        struct Service: Codable {
            let serviceType, serviceDescription: String

            enum CodingKeys: String, CodingKey {
                case serviceType
                case serviceDescription = "description"
            }
        }
    }
}

// MARK: - RequestableData
extension BelarusbankATM: RequestableData {
    static var urlRequest: URLRequest {
        let url = URL(string: "https://belarusbank.by/open-banking/v1.0/atms")
        let urlRequest = URLRequest(url: url!)
        return urlRequest
    }
}
