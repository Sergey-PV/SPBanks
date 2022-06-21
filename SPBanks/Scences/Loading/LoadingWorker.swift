//
//  LoadingWorker.swift
//  SPBanks
//
//  Created by Sergey Parfentchik on 15.06.22.
//

import UIKit

class LoadingWorker {
    func fetchData<T: RequestableData>(on decodable: T.Type, result: @escaping (Result<T, Error>) -> Void) {
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
