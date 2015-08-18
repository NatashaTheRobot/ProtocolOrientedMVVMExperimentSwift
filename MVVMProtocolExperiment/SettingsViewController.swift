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
        case MinionMode
        // other settings here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int
    {
        return 1
    }

    override func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        if let setting = Setting(rawValue: indexPath.row) {
            switch setting {
            case .MinionMode:
                let cell = tableView.dequeueReusableCellWithIdentifier("SwitchWithTextTableViewCell", forIndexPath: indexPath) as! SwitchWithTextTableViewCell
                
                // this is where the magic happens!
                let viewModel = MinionModeViewModel()
                cell.configure(withDataSource: viewModel, delegate: viewModel)
                return cell
            }
        }
        
        return tableView.dequeueReusableCellWithIdentifier("defaultCell", forIndexPath: indexPath)
    }

}
