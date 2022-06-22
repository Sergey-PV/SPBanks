//
//  BelarusbankBranches.swift
//  SPBanks
//
//  Created by Sergey Parfentchik on 12.06.22.
//

import Foundation
import CoreLocation

struct BelarusbankBranches: Codable {
    var data = DataClass.init(branch: [])

    enum CodingKeys: String, CodingKey {
        case data = "Data"
    }

    // MARK: - DataClass
    struct DataClass: Codable {
        var branch: [Branch]

        enum CodingKeys: String, CodingKey {
            case branch = "Branch"
        }

        // MARK: - Branch
        class Branch: Codable {
            let branchID: String
            let name: String
            let cbu: String?
            let accountNumber: String?
            let equeue, wifi: Int
            let accessibilities: Accessibilities
            let address: Address
            let information: Information
            let services: Services

            enum CodingKeys: String, CodingKey {
                case branchID = "branchId"
                case name
                case cbu = "CBU"
                case accountNumber, equeue, wifi
                case accessibilities = "Accessibilities"
                case address = "Address"
                case information = "Information"
                case services = "Services"
            }
        }

        // MARK: - Accessibilities
        struct Accessibilities: Codable {
            let accessibility: Accessibility

            enum CodingKeys: String, CodingKey {
                case accessibility = "Accessibility"
            }
        }

        // MARK: - Accessibility
        struct Accessibility: Codable {
            let accessibilityDescription: String

            enum CodingKeys: String, CodingKey {
                case accessibilityDescription = "description"
            }
        }

        // MARK: - Address
        struct Address: Codable {
            let streetName, buildingNumber, department, postCode: String
            let townName, countrySubDivision, country, addressLine: String
            let addressDescription: String
            let geoLocation: GeoLocation

            enum CodingKeys: String, CodingKey {
                case streetName
                case buildingNumber
                case department
                case postCode
                case townName
                case countrySubDivision
                case country
                case addressLine
                case addressDescription = "description"
                case geoLocation = "GeoLocation"
            }
        }

        // MARK: - GeoLocation
        struct GeoLocation: Codable {
            let geographicCoordinates: GeographicCoordinates

            enum CodingKeys: String, CodingKey {
                case geographicCoordinates = "GeographicCoordinates"
            }
        }

        // MARK: - GeographicCoordinates
        struct GeographicCoordinates: Codable {
            let latitude, longitude: String
        }

        // MARK: - Information
        struct Information: Codable {
            let segment: Segment
            let availability: Availability
            let contactDetails: ContactDetails

            enum CodingKeys: String, CodingKey {
                case segment
                case availability = "Availability"
                case contactDetails = "ContactDetails"
            }
        }

        // MARK: - Availability
        struct Availability: Codable {
            let access24Hours, isRestricted, sameAsOrganization: Int
            let availabilityDescription: String
            let standardAvailability: StandardAvailability
            let nonStandardAvailability: [NonStandardAvailability]

            enum CodingKeys: String, CodingKey {
                case access24Hours, isRestricted, sameAsOrganization
                case availabilityDescription = "description"
                case standardAvailability = "StandardAvailability"
                case nonStandardAvailability = "NonStandardAvailability"
            }
        }

        // MARK: - NonStandardAvailability
        struct NonStandardAvailability: Codable {
            let name, fromDate, toDate, nonStandardAvailabilityDescription: String
            let day: NonStandardAvailabilityDay

            enum CodingKeys: String, CodingKey {
                case name, fromDate, toDate
                case nonStandardAvailabilityDescription = "description"
                case day = "Day"
            }
        }

        // MARK: - NonStandardAvailabilityDay
        struct NonStandardAvailabilityDay: Codable {
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

        // MARK: - StandardAvailability
        struct StandardAvailability: Codable {
            let day: [DayElement]

            enum CodingKeys: String, CodingKey {
                case day = "Day"
            }
        }

        // MARK: - DayElement
        struct DayElement: Codable {
            let dayCode: Int
            let openingTime, closingTime: String
            let dayBreak: Break

            enum CodingKeys: String, CodingKey {
                case dayCode, openingTime, closingTime
                case dayBreak = "Break"
            }
        }

        // MARK: - ContactDetails
        struct ContactDetails: Codable {
            let name, phoneNumber, mobileNumber, faxNumber: String
            let emailAddress, other: String
            let socialNetworks: [SocialNetwork]

            enum CodingKeys: String, CodingKey {
                case name, phoneNumber, mobileNumber, faxNumber, emailAddress, other
                case socialNetworks = "SocialNetworks"
            }
        }

        // MARK: - SocialNetwork
        struct SocialNetwork: Codable {
            let networkName: String
            let url: String
            let socialNetworkDescription: String

            enum CodingKeys: String, CodingKey {
                case networkName, url
                case socialNetworkDescription = "description"
            }
        }

        enum Segment: String, Codable {
            case business = "Business"
            case individual = "Individual"
        }

        // MARK: - Services
        struct Services: Codable {
            let service: [String: String]

            enum CodingKeys: String, CodingKey {
                case service = "Service"
            }
        }

        // MARK: - CurrencyExchange
        struct CurrencyExchange: Codable {
            let exchangeTypeStaticType: String
            let sourceCurrency, targetCurrency, exchangeRate: String
            let direction: String
            let scaleCurrency: String
            let dateTime: String

            enum CodingKeys: String, CodingKey {
                case exchangeTypeStaticType = "ExchangeTypeStaticType"
                case sourceCurrency, targetCurrency, exchangeRate, direction, scaleCurrency, dateTime
            }
        }

        enum CurrentStatus: String, Codable {
            case active = "Active"
            case inactive = "Inactive"
        }
    }
}

// MARK: - RequestableData
extension BelarusbankBranches: RequestableData {
    static var urlRequest: URLRequest {
        let url = URL(string: "https://belarusbank.by/open-banking/v1.0/branches")
        let urlRequest = URLRequest(url: url!)
        return urlRequest
    }
}
