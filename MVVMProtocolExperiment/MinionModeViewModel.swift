//
//  MyViewModel.swift
//  MVVMProtocolExperiment
//
//  Created by Natasha Murashev on 8/16/15.
//  Copyright © 2015 NatashaTheRobot. All rights reserved.
//

import UIKit

struct MinionModeViewModel: SwitchWithTextViewPresentable {
    
}

extension MinionModeViewModel {
    var text: String { return "Minion mode" }
    var textColor: UIColor { return .black }
    var font: UIFont { return .systemFont(ofSize: 17)}
}

extension MinionModeViewModel {
    var switchOn: Bool { return false}
    var switchColor: UIColor { return .yellow }
    
    func onSwitchToggleOn(_ on: Bool) {
        if on {
            print("The minion is on")
        }
        else {
            print("The minion is off")
        }
    }
}
