//
//  Model.swift
//  MoneyCalculator
//
//  Created by Александр  Бровков  on 03.06.2020.
//  Copyright © 2020 Александр  Бровков . All rights reserved.
//

import UIKit

enum Type: Int {
    case one = 1
    case two = 2
    case three = 3
    case four = 4
    case five = 5
    case six = 6
    case seven = 7
    case eight = 8
    case nine = 9
    case ten = 10
    case eleven = 11
    case twelve = 12
    case thirteen = 13
    case fourteen = 14
    case fifteen = 15
    case sixteen = 16
    
    var title: String {
        switch self {
        case .one:
            return "1"
        case .two:
            return "2"
        case .three:
            return "3"
        case .four:
            return "+"
        case .five:
            return "4"
        case .six:
            return "5"
        case .seven:
            return "6"
        case .eight:
            return "-"
        case .nine:
            return "7"
        case .ten:
            return "8"
        case .eleven:
            return "9"
        case .twelve:
            return "×"
        case .thirteen:
            return "="
        case .fourteen:
            return "0"
        case .fifteen:
            return "."
        case .sixteen:
            return "÷"
        }
    }
    
    var selector: Selector {
        switch self {
        case .one, .two, .three, .five, .six, .seven, .nine, .ten, .eleven, .fourteen, .fifteen:
            return #selector(MainMenuViewController.touchDigit)
        case .four, .eight, .twelve, .thirteen, .sixteen:
            return #selector(MainMenuViewController.performOperation)
        }
    }
    
    var parentStackTag: Int {
        switch self {
        case .one, .two, .three, .four:
            return 1
        case .five, .six, .seven, .eight:
            return 2
        case .nine, .ten, .eleven, .twelve:
            return 3
        case .thirteen, .fourteen, .fifteen, .sixteen:
            return 4
        }
    }
}
