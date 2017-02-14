//
//  MyTableViewController.swift
//  MVVMProtocolExperiment
//
//  Created by Natasha Murashev on 8/16/15.
//  Copyright © 2015 NatashaTheRobot. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {

    enum Setting: Int {
        case minionMode
        // other settings here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int
    {
        return 1
    }

    override func tableView(_ tableView: UITableView,
        cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if let setting = Setting(rawValue: indexPath.row) {
            switch setting {
            case .minionMode:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SwitchWithTextTableViewCell", for: indexPath) as! SwitchWithTextTableViewCell
                
                // this is where the magic happens!
                let viewModel = MinionModeViewModel()
                cell.configure(withDataSource: viewModel, delegate: viewModel)
                return cell
            }
        }
        
        return tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath)
    }

}
