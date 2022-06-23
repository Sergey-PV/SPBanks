//
//  URLSession+Ex.swift
//  SPBanks
//
//  Created by Sergey Parfentchik on 23.06.22.
//

import Foundation

extension URLSession {
    static func performRequest<T: RequestableData>(on decodable: T.Type,
                                                   result: @escaping (Result<T, Error>) -> Void) {
        URLSession.shared.dataTask(with: decodable.urlRequest) { data, _, error in
            guard let data = data else { return }
            do {
                let object = try JSONDecoder().decode(decodable, from: data)
                result(.success(object))
            } catch {
                result(.failure(error))
            }
        }.resume()
    }
}
