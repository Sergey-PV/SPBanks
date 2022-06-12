//
//  ListInteractor.swift
//  SPBanks
//
//  Created by Sergey Parfentchik on 12.06.22.
//

import UIKit

protocol ListBusinessLogic {
    func doSomething(request: List.Something.Request)
}

protocol ListDataStore {
    //var name: String { get set }
}

class ListInteractor: ListBusinessLogic, ListDataStore {
    var presenter: ListPresentationLogic?
    var worker: ListWorker?
    //var name: String = ""

    // MARK: Do something

    func doSomething(request: List.Something.Request) {
        worker = ListWorker()
        worker?.doSomeWork()
        
        let response = List.Something.Response()
        presenter?.presentSomething(response: response)
    }
}
