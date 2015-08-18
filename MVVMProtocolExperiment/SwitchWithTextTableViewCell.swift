//
//  SwitchWithTextTableViewCell.swift
//  MVVMProtocolExperiment
//
//  Created by Natasha Murashev on 8/16/15.
//  Copyright © 2015 NatashaTheRobot. All rights reserved.
//

import UIKit

protocol SwitchWithTextCellDataSource {
    var title: String { get }
    var switchOn: Bool { get }
}

protocol SwitchWithTextCellDelegate {
    func onSwitchTogleOn(on: Bool)
    
    var switchColor: UIColor { get }
    var textColor: UIColor { get }
    var font: UIFont { get }
}

extension SwitchWithTextCellDelegate {
    
    var switchColor: UIColor {
        return .purpleColor()
    }
    
    var textColor: UIColor {
        return .blackColor()
    }
    
    var font: UIFont {
        return .systemFontOfSize(17)
    }
}

class SwitchWithTextTableViewCell: UITableViewCell {

    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var switchToggle: UISwitch!

    private var dataSource: SwitchWithTextCellDataSource?
    private var delegate: SwitchWithTextCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(withDataSource dataSource: SwitchWithTextCellDataSource, delegate: SwitchWithTextCellDelegate?) {
        self.dataSource = dataSource
        self.delegate = delegate
        
        label.text = dataSource.title
        switchToggle.on = dataSource.switchOn
        // color option added!
        switchToggle.onTintColor = delegate?.switchColor
    }

    @IBAction func onSwitchToggle(sender: UISwitch) {
        delegate?.onSwitchTogleOn(sender.on)
    }
}

// BEFORE 
//class SwitchWithTextTableViewCell: UITableViewCell {
//    
//    @IBOutlet private weak var label: UILabel!
//    @IBOutlet private weak var switchToggle: UISwitch!
//    
//    typealias onSwitchToggleHandlerType = (switchOn: Bool) -> Void
//    private var onSwitchToggleHandler: onSwitchToggleHandlerType?
//    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//    }
//    
//    func configure(withTitle title: String,
//        switchOn: Bool,
//        switchColor: UIColor = .purpleColor(),
//        onSwitchToggleHandler: onSwitchToggleHandlerType? = nil)
//    {
//        label.text = title
//        switchToggle.on = switchOn
//        // color option added!
//        switchToggle.onTintColor = switchColor
//        
//        self.onSwitchToggleHandler = onSwitchToggleHandler
//    }
//    
//    @IBAction func onSwitchToggle(sender: UISwitch) {
//        onSwitchToggleHandler?(switchOn: sender.on)
//    }
//}

