//
//  LoadingInteractor.swift
//  SPBanks
//
//  Created by Sergey Parfentchik on 15.06.22.
//

import UIKit

protocol LoadingBusinessLogic {
    func doSomething(request: Loading.Something.Request)
}

protocol LoadingDataStore {
    var belarusbankATM: BelarusbankATM { get set }
}

class LoadingInteractor: LoadingBusinessLogic, LoadingDataStore {
    var presenter: LoadingPresentationLogic?
    var worker: LoadingWorker?
    var belarusbankATM = BelarusbankATM()

    // MARK: - Do something

    func doSomething(request: Loading.Something.Request) {
        worker = LoadingWorker()
        worker?.fetchData(on: BelarusbankATM.self, result: { [weak self] result in
            switch result {
            case .success(let data):
                self?.belarusbankATM = data as BelarusbankATM
            case .failure(let error):
                print(error)
            }
        })
        let response = Loading.Something.Response()
        presenter?.presentSomething(response: response)
    }
}
