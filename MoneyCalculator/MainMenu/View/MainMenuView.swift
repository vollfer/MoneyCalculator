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
    
}

class MainMenuViewController: UIViewController {
    
    //MARK: - Properties
    
    var presenter: MainMenuViewOutput?
    
    let lable = UILabel()
    let zerbutton = UIButton()
    let onebutton = UIButton()
    let twobutton = UIButton()
    let thebutton = UIButton()
    let forbutton = UIButton()
    let fifbutton = UIButton()
    let sexbutton = UIButton()
    let sevbutton = UIButton()
    let eatbutton = UIButton()
    let ninbutton = UIButton()
    
    
    
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
        
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.backgroundColor = .white
        lable.text = "0"
        
        let stack1 = UIStackView()
        stack1.axis = .horizontal
        let stack2 = UIStackView()
        stack2.axis = .horizontal
        let stack3 = UIStackView()
        stack3.axis = .horizontal
        
        
        for index in 1...9 {
            let button = UIButton()
            
            button.tag = index
            
            switch index {
            case 1...3:
                stack1.addArrangedSubview(button)
            case 4...6:
                stack2.addArrangedSubview(button)
            case 7...9:
                stack3.addArrangedSubview(button)
            default:
                break
            }
        }
        stack1.translatesAutoresizingMaskIntoConstraints = false
        
        
//        let buttonStackView = UIStackView(arrangedSubviews: [zerbutton, onebutton, twobutton, thebutton, forbutton, fifbutton, sexbutton, sevbutton, eatbutton, ninbutton])
//        buttonStackView.alignment = .center
//        buttonStackView.axis = .horizontal
//        buttonStackView.backgroundColor = .clear
//        buttonStackView.spacing = 8
//
//        view.addSubview(buttonStackView)
        
        stack1.arrangedSubviews.forEach { button in
            
            guard let button = button as? UIButton else { return }
            button.layer.cornerRadius = 5
            button.layer.borderWidth = 1
            
            button.setTitleColor(.white, for: .normal)
            button.layer.borderColor = UIColor.red.cgColor
        }
        
        view.addSubview(lable)
        view.addSubview(stack1)
        
        NSLayoutConstraint.activate([
            lable.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            lable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack1.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            stack1.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            stack1.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
        
    }
}

// MARK: - MainMenuViewInput
extension MainMenuViewController: MainMenuInput {
    
}
