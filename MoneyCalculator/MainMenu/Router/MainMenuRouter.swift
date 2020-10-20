//
//  MainMenuRouter.swift
//  moneyCalculator
//
//  Created by Александр  Бровков  on 07.05.2020.
//  Copyright © 2020 Александр  Бровков . All rights reserved.
//

import Foundation

protocol  MainMenuRouterInput {
    
}

final class MainMenuRouter {
    
    //MARK: - Properties
    
    unowned let transition: ModuleTransitionHandler
    
    
    //MARK: - Init
    
    init(transition: ModuleTransitionHandler) {
        self.transition = transition
    }
}

//MARK: - MainMenuRouterInput
extension MainMenuRouter: MainMenuRouterInput {
    
}
