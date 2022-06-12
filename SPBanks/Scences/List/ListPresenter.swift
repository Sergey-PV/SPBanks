//
//  ListPresenter.swift
//  SPBanks
//
//  Created by Sergey Parfentchik on 12.06.22.
//

import UIKit

protocol ListPresentationLogic {
    func presentSomething(response: List.Something.Response)
}

class ListPresenter: ListPresentationLogic {
    weak var viewController: ListDisplayLogic?

    // MARK: Do something

    func presentSomething(response: List.Something.Response) {
        let viewModel = List.Something.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
}
