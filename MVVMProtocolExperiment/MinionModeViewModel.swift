//
//  MyViewModel.swift
//  MVVMProtocolExperiment
//
//  Created by Natasha Murashev on 8/16/15.
//  Copyright © 2015 NatashaTheRobot. All rights reserved.
//

import UIKit

struct MinionModeViewModel: SwitchWithTextCellDataSource {
    var title = "Minion Mode!!!"
    var switchOn = true
}

extension MinionModeViewModel: SwitchWithTextCellDelegate {
    
    func onSwitchTogleOn(_ on: Bool) {
        if on {
            print("The Minions are here to stay!")
        } else {
            print("The Minions went out to play!")
        }
    }
    
    var switchColor: UIColor {
        return .yellow
    }
}
