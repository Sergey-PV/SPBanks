//
//  LoadingInteractor.swift
//  SPBanks
//
//  Created by Sergey Parfentchik on 15.06.22.
//

import UIKit

protocol LoadingBusinessLogic {
    func fetchData(request: Loading.Something.Request)
}

protocol LoadingDataStore {
    var belarusbankATM: BelarusbankATM { get set }
    var belarusbankBranch: BelarusbankBranches { get set }
}

class LoadingInteractor: LoadingBusinessLogic, LoadingDataStore {
    var belarusbankATM = BelarusbankATM()
    var belarusbankBranch = BelarusbankBranches()
    var presenter: LoadingPresentationLogic?
    var worker: LoadingWorker?

    // MARK: - Fetch Data
    func fetchData(request: Loading.Something.Request) {
    }

    private func fetchBelarusbankBranches() {
        worker?.fetchData(on: BelarusbankBranches.self, result: { [weak self] result in
            switch result {
            case .success(let data):
                self?.belarusbankBranch = data
            case .failure(let error):
                print(error)
            }
        })
        let response = Loading.Something.Response()
        presenter?.presentSomething(response: response)
    }

    private func fetchBelarusbankATM() {
        worker = LoadingWorker()
        worker?.fetchData(on: BelarusbankATM.self, result: { [weak self] result in
            switch result {
            case .success(let data):
                self?.belarusbankATM = data
            case .failure(let error):
                print(error)
            }
        })
        let response = Loading.Something.Response()
        presenter?.presentSomething(response: response)
    }
}
