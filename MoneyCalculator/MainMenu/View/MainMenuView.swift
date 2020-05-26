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

class MainMenuViewController: UIViewController {
    
    //MARK: - Properties
    
    var presenter: MainMenuViewOutput?
    
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
        navigationController?.setToolbarHidden(false, animated: true)
        
        view.backgroundColor = .white
        drawSelf()
    }
    
    func drawSelf() {
        
        title = "Pacходы"
        
        entryField.translatesAutoresizingMaskIntoConstraints = false
        entryField.backgroundColor = .white
        entryField.text = "Введите сумму"
        entryField.textAlignment = .right
        
        let stack1 = UIStackView()
        stack1.axis = .horizontal
        stack1.spacing = 5
        let stack2 = UIStackView()
        stack2.axis = .horizontal
        stack2.spacing = 5
        let stack3 = UIStackView()
        stack3.axis = .horizontal
        stack3.spacing = 5
        let stack4 = UIStackView()
        stack4.axis = .horizontal
        stack4.spacing = 5
        let stackAllButton = UIStackView(arrangedSubviews: [entryField, stack1, stack2, stack3, stack4])
        stackAllButton.axis = .vertical
        stackAllButton.alignment = .center
        stackAllButton.spacing = 5
        
        for index in 1...16 {
            
            let button: UIButton = {
                let but = UIButton()
                but.layer.cornerRadius = 5
                but.layer.borderWidth = 1
                
                but.setTitleColor(.black, for: .normal)
                but.layer.borderColor = UIColor.red.cgColor
                return but
            }()
            
           // button.addTarget(self, action: #selector(touchDigit), for: .touchUpInside)
            
            button.tag = index
            
            //MARK: - потом нужно будет исправить все повторения.
            
            switch index {
            case 1...4:
                stack1.addArrangedSubview(button)
                if button.tag == 4{
                    button.setTitle("+", for: .normal)
                    button.addTarget(self, action: #selector(performOperation), for: .touchUpInside)
                } else {
                    button.setTitle("\(index)", for: .normal)
                    button.addTarget(self, action: #selector(touchDigit), for: .touchUpInside)
                }
            case 5...8:
                stack2.addArrangedSubview(button)
                if button.tag == 8{
                    button.setTitle("-", for: .normal)
                    button.addTarget(self, action: #selector(performOperation), for: .touchUpInside)
                } else if button.tag == 5 {
                    button.setTitle("4", for: .normal)
                    button.addTarget(self, action: #selector(touchDigit), for: .touchUpInside)
                } else if button.tag == 6 {
                    button.setTitle("5", for: .normal)
                    button.addTarget(self, action: #selector(touchDigit), for: .touchUpInside)
                } else if button.tag == 7 {
                    button.setTitle("6", for: .normal)
                    button.addTarget(self, action: #selector(touchDigit), for: .touchUpInside)
                }
            case 9...12:
                stack3.addArrangedSubview(button)
                if button.tag == 9 {
                    button.setTitle("7", for: .normal)
                    button.addTarget(self, action: #selector(touchDigit), for: .touchUpInside)
                } else if button.tag == 10 {
                    button.setTitle("8", for: .normal)
                    button.addTarget(self, action: #selector(touchDigit), for: .touchUpInside)
                } else if button.tag == 11 {
                    button.setTitle("9", for: .normal)
                    button.addTarget(self, action: #selector(touchDigit), for: .touchUpInside)
                } else if button.tag == 12 {
                    button.setTitle("x", for: .normal)
                    button.addTarget(self, action: #selector(performOperation), for: .touchUpInside)
                }
            case 13...16:
                stack4.addArrangedSubview(button)
                if button.tag == 13 {
                    button.setTitle("=", for: .normal)
                    button.addTarget(self, action: #selector(performOperation), for: .touchUpInside)
                } else if button.tag == 14 {
                    button.setTitle("0", for: .normal)
                    button.addTarget(self, action: #selector(touchDigit), for: .touchUpInside)
                } else if button.tag == 15 {
                    button.setTitle(".", for: .normal)
                    button.addTarget(self, action: #selector(touchDigit), for: .touchUpInside)
                } else if button.tag == 16 {
                    button.setTitle("/", for: .normal)
                    button.addTarget(self, action: #selector(performOperation), for: .touchUpInside)
                }
            default:
                break
            }
        }
        
        stackAllButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackAllButton)
        
        NSLayoutConstraint.activate([
            stackAllButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            stackAllButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            stackAllButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
        ])
        
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
