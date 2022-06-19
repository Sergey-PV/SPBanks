//
//  LoadingView.swift
//  SPBanks
//
//  Created by Sergey Parfentchik on 19.06.22.
//

import UIKit

class LoadingView: UIView {

    // MARK: - UIElements
    private lazy var loadingActivityIndicatorView: UIActivityIndicatorView = {
        let loadingActivityIndicatorView = UIActivityIndicatorView(style: .large)
        loadingActivityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        return loadingActivityIndicatorView
    }()

    // MARK: - Initialize
    init() {
        super.init(frame: .zero)
        setting()
        addSubviews()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods
    private func setting() {
        backgroundColor = ConstantColor.background
        loadingActivityIndicatorView.startAnimating()
    }

    private func addSubviews() {
        addSubview(loadingActivityIndicatorView)
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            centerXAnchor.constraint(equalTo: loadingActivityIndicatorView.centerXAnchor),
            centerYAnchor.constraint(equalTo: loadingActivityIndicatorView.centerYAnchor)
        ])
    }
    
    deinit {
        loadingActivityIndicatorView.stopAnimating()
    }
}
