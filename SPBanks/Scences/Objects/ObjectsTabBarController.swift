//
//  ObjectsTabBarController.swift
//  SPBanks
//
//  Created by Sergey Parfentchik on 14.06.22.
//

import UIKit

// MARK: - ObjectsTabBarController
class ObjectsTabBarController: UITabBarController {
    
    // MARK: - UIElements
    private(set) lazy var mapViewController = MapViewController()
    private(set) lazy var listViewController = ListViewController()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [mapViewController, listViewController]
    }

}
