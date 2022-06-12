//
//  DetailsPresenter.swift
//  SPBanks
//
//  Created by Sergey Parfentchik on 12.06.22.
//

import UIKit

protocol DetailsPresentationLogic {
    func presentSomething(response: Details.Something.Response)
}

class DetailsPresenter: DetailsPresentationLogic {
    weak var viewController: DetailsDisplayLogic?

    // MARK: Do something

    func presentSomething(response: Details.Something.Response) {
        let viewModel = Details.Something.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
}
