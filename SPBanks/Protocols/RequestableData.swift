//
//  RequestableData.swift
//  SPBanks
//
//  Created by Sergey Parfentchik on 20.06.22.
//

import Foundation

protocol RequestableData: Decodable {
    static var urlRequest: URLRequest { get }
}


