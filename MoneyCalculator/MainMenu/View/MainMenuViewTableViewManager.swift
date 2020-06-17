//
//  MainMenuViewTableViewManager.swift
//  MoneyCalculator
//
//  Created by Александр  Бровков  on 26.05.2020.
//  Copyright © 2020 Александр  Бровков . All rights reserved.
//

import UIKit

protocol CostViewTableViewManagerInput {
    func setup(tableView: UITableView)
    func update(with settingsTitleText: [CostCellType])
    func reloadData()
}

final class CostViewTableViewManager: NSObject {
    
    //private weak var cellDelegate: SettingsTableViewCellDelegat?
    private weak var tableView: UITableView?
    
    var costTitleText: [CostCellType] = []
    
//    init(cellDelegate: SettingsTableViewCellDelegat) {
//        self.cellDelegate = cellDelegate
//    }
}

// MARK: - SettingsViewTableViewManagerInput

extension CostViewTableViewManager: CostViewTableViewManagerInput {
    
    func reloadData() {
        tableView?.reloadData()
    }
    
    func update(with settingsTitleText: [CostCellType]) {
        self.costTitleText = settingsTitleText
        tableView?.reloadData()
    }
    
    
    func setup(tableView: UITableView) {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: "SettingsTableViewCell")
        
        self.tableView = tableView
    }
}

extension CostViewTableViewManager: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return costTitleText.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsTableViewCell", for: indexPath)
        let cellType = costTitleText[indexPath.row]
        
//        (cell as? SettingsTableViewCell)?.delegat = cellDelegate
//        (cell as? SettingsTableViewCell)?.cellType = cellType
        
        cell.textLabel?.text = cellType.title
        
        return cell
    }
}

extension CostViewTableViewManager: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        }
    }
