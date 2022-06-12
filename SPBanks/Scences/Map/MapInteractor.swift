//
//  MapInteractor.swift
//  SPBanks
//
//  Created by Sergey Parfentchik on 12.06.22.
//

import UIKit

protocol MapBusinessLogic {
    func doSomething(request: Map.Something.Request)
}

protocol MapDataStore {
    //var name: String { get set }
}

class MapInteractor: MapBusinessLogic, MapDataStore {
    var presenter: MapPresentationLogic?
    var worker: MapWorker?
    //var name: String = ""

    // MARK: Do something

    func doSomething(request: Map.Something.Request) {
        worker = MapWorker()
        worker?.doSomeWork()
        
        let response = Map.Something.Response()
        presenter?.presentSomething(response: response)
    }
}
