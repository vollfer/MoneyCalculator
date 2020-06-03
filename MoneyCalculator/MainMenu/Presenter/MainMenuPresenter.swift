//
//  MainMenuPresenter.swift
//  moneyCalculator
//
//  Created by Александр  Бровков  on 07.05.2020.
//  Copyright © 2020 Александр  Бровков . All rights reserved.
//

import Foundation
import UIKit

public enum SettingsCellType {
    case onboarding
    case restorePurchases
    case aboutApp
    case feedback

    var title: String {
        
        switch self {
        case .onboarding:
            return "sdfwef"
        case .restorePurchases:
            return "ds"
        case .aboutApp:
            return "sdf"
        case .feedback:
            return "fewfw"
        }
    }
}

protocol MainMenuInput: class {
    func performOperation(_ sender: UIButton)
    func updateView(with settingsTitleText: [SettingsCellType])
}

class MainMenuPresenter {
    
    //MARK: - Properties
    
    weak var view: MainMenuInput?
    var router: MainMenuRouterInput?
    private var accumulator: Double?
    
    var result: Double? {
        get {
            return accumulator
        }
    }
    
    private enum Operation {
        case binaryOperation​((Double,Double) -> Double)
        case equals
    }
    
    private var operation: Dictionary<String,Operation> = [
        "=" : Operation.equals,
        "×" : Operation.binaryOperation​({$0 * $1}),
        "-" : Operation.binaryOperation​({$0 - $1}),
        "+" : Operation.binaryOperation​({$0 + $1}),
        "÷" : Operation.binaryOperation​({$0 / $1}),
    ]
    
    private var ​pendingBinaryOperation: PendingBinaryOperation?
    
    private struct PendingBinaryOperation {
        let function: (Double,Double) -> Double
        let firstOperation: Double
        
        func perform(with secondOperand: Double) -> Double {
            return function(firstOperation, secondOperand)
        }
    }
    
}

// MARK: - MainMenuPresener
extension MainMenuPresenter: MainMenuViewOutput {

    func viewIsReady() {
        let settingsTitleText: [SettingsCellType] = [.onboarding, .restorePurchases, .aboutApp, .feedback]
        view?.updateView(with: settingsTitleText)
    }
    
    func setOperand ( _ operand: Double) {
        accumulator = operand
    }
    
    func performPendingBinaryOperation​() {
        if ​pendingBinaryOperation != nil && accumulator != nil {
            accumulator = ​pendingBinaryOperation?.perform(with: accumulator!)
            ​pendingBinaryOperation = nil
        }
    }
    
    func performOperation ( _ symbol: String) {
        if let operation = operation[symbol] {
            switch  operation {
            case .binaryOperation​(let function):
                if accumulator != nil {
                    ​pendingBinaryOperation = PendingBinaryOperation(function: function, firstOperation: accumulator!)
                    accumulator = nil
                }
            case .equals:
                performPendingBinaryOperation​()
            }
        }
    }
}

extension MainMenuPresenter: SettingsTableViewCellDelegat {
    func didSelectCell(with type: SettingsCellType) {
        
    }
    
    
}
