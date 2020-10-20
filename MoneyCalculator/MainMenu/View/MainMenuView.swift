//
//  MainMenuView.swift
//  moneyCalculator
//
//  Created by Александр  Бровков  on 07.05.2020.
//  Copyright © 2020 Александр  Бровков . All rights reserved.
//

import UIKit
import Foundation

protocol MainMenuViewOutput: ViewOutput {
    func performOperation ( _ symbol: String)
    func performPendingBinaryOperation​()
    func setOperand( _: Double)
    var result: Double? {get}
    }

final class MainMenuViewController: UIViewController {
    
    //MARK: - Properties
    
    var presenter: MainMenuViewOutput?
    var settingsViewTableViewManager: CostViewTableViewManagerInput?
    
    let cash: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.black, for: .normal)
        button.setTitle("0", for: .normal)
        return button
    }()
    let entryField = UILabel()
    var dataSet = false
    var displayValue: Double {
        get {
            return Double(entryField.text!)!
        }
        set {
            entryField.text = String(newValue)
        }
    }
    
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: true)
        //navigationController?.setToolbarHidden(false, animated: true)
        
        view.backgroundColor = .white
        drawSelf()
    }
    
    func drawSelf() {
        
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        title = "Pacходы"
        
        entryField.backgroundColor = .white
        entryField.text = "Введите сумму"
        entryField.textAlignment = .right
        
        
        let stackAllButton = UIStackView(arrangedSubviews: [entryField])
        stackAllButton.axis = .vertical
        stackAllButton.alignment = .center
        stackAllButton.spacing = 5
        
        for _ in 1...4{
            let stack = UIStackView()
            stack.axis = .horizontal
            stack.spacing = 5
            stackAllButton.addArrangedSubview(stack)
        }
        
        for index in 1...16 {
            
            let button: UIButton = {
                let but = UIButton()
                but.layer.cornerRadius = 5
                but.layer.borderWidth = 1
                
                but.setTitleColor(.black, for: .normal)
                but.layer.borderColor = UIColor.red.cgColor
                return but
            }()
            
            button.tag = index
            guard let buttonType = Type(rawValue: index) else {return}
            button.setTitle(buttonType.title, for: .normal)
            button.addTarget(self, action: buttonType.selector, for: .touchUpInside)
            (stackAllButton.arrangedSubviews[buttonType.parentStackTag] as? UIStackView)?.addArrangedSubview(button)
        }
        
        stackAllButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(cash)
        view.addSubview(stackAllButton)
        view.addSubview(tableView)
        
        
        NSLayoutConstraint.activate([
            
            cash.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            cash.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            cash.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            
           // cash.bottomAnchor.constraint(equalTo: view.)
            
            stackAllButton.topAnchor.constraint(equalTo: cash.bottomAnchor),
            stackAllButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            stackAllButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            stackAllButton.bottomAnchor.constraint(equalTo: view.centerYAnchor),
            
            tableView.topAnchor.constraint(equalTo: stackAllButton.bottomAnchor, constant: 100),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        settingsViewTableViewManager?.setup(tableView: tableView)
        // tableView.tableFooterView = UIView()
        presenter?.viewIsReady()
        
    }
    
    @objc func touchDigit(_ sender: UIButton) {
        
        let digit = sender.currentTitle!
        
        if dataSet {
            let textCurrentlyInDisplay = entryField.text!
            if (digit != ".") || (textCurrentlyInDisplay.range(of: ".") == nil) {
                entryField.text = textCurrentlyInDisplay + digit
            }
        } else {
            entryField.text = digit
        }
        dataSet = true
    }
}

// MARK: - MainMenuViewInput
extension MainMenuViewController: MainMenuInput {
    
    func updateView(with settingsTitleText: [CostCellType]) {
        settingsViewTableViewManager?.update(with: settingsTitleText)
    }
    
    @objc func performOperation(_ sender: UIButton) {
        if dataSet {
            presenter?.setOperand(displayValue)
            dataSet = false
        }
        if let mathematicalSymbol = sender.currentTitle {
            presenter?.performOperation(mathematicalSymbol)
        }
        if let result = presenter?.result{
            displayValue = result
        }
    }
}
