//
//  cell.swift
//  MoneyCalculator
//
//  Created by Александр  Бровков  on 27.05.2020.
//  Copyright © 2020 Александр  Бровков . All rights reserved.
//

import UIKit

protocol SettingsTableViewCellDelegat: class {
    func didSelectCell(with type: SettingsCellType)
}

final class SettingsTableViewCell: UITableViewCell {
    weak var delegat: SettingsTableViewCellDelegat?
    var cellType: SettingsCellType? {
        didSet {
            switch cellType {
            case .onboarding:
                accessoryType = .none
            case .restorePurchases:
                accessoryType = .disclosureIndicator
            case .aboutApp:
                accessoryType = .disclosureIndicator
            case .feedback:
                accessoryType = .none
            case .none:
                break
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
