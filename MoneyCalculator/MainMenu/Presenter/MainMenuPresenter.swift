//
//  MainMenuPresenter.swift
//  moneyCalculator
//
//  Created by Александр  Бровков  on 07.05.2020.
//  Copyright © 2020 Александр  Бровков . All rights reserved.
//

import Foundation

protocol MainMenuInput: class {
    
}

class MainMenuPresenter {
    
    //MARK: - Properties
    
    weak var view: MainMenuInput?
    var router: MainMenuRouterInput?
    
}
// MARK: - MainMenuPresener
extension MainMenuPresenter: MainMenuViewOutput {
    func viewIsReady() {
        
    }
    
}
