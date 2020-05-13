//
//  ViewOutput.swift
//  moneyCalculator
//
//  Created by Александр  Бровков  on 07.05.2020.
//  Copyright © 2020 Александр  Бровков . All rights reserved.
//

protocol ViewOutput: class {
    func viewIsReady()
    func viewWillAppear()
    func viewDidAppear()
}

extension ViewOutput {
    func viewWillAppear() { }
    func viewDidAppear() { }
}
