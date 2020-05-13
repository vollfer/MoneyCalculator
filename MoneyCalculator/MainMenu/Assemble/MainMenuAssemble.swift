//
//  MainMenuAssemble.swift
//  moneyCalculator
//
//  Created by Александр  Бровков  on 07.05.2020.
//  Copyright © 2020 Александр  Бровков . All rights reserved.
//

import UIKit

final class MainMenuAssemble: Assembly {
    
    static func assembleModuleNavigation() -> ModuleNavigation {

        let module = MainMenuViewController()
        let presenter = MainMenuPresenter()
        let router = MainMenuRouter(transition: module)

        module.presenter = presenter

        presenter.view = module
        presenter.router = router

        let navigationController = UINavigationController(rootViewController: module)
        navigationController.setNavigationBarHidden(true, animated: false)

        return navigationController
    }
}
