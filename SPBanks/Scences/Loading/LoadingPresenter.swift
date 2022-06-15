//
//  LoadingPresenter.swift
//  SPBanks
//
//  Created by Sergey Parfentchik on 15.06.22.
//

import UIKit

protocol LoadingPresentationLogic {
    func presentSomething(response: Loading.Something.Response)
}

class LoadingPresenter: LoadingPresentationLogic {
    weak var viewController: LoadingDisplayLogic?

    // MARK: Do something

    func presentSomething(response: Loading.Something.Response) {
        let viewModel = Loading.Something.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
}
