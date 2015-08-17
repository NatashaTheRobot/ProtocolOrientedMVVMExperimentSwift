//
//  SwitchWithTextTableViewCell.swift
//  MVVMProtocolExperiment
//
//  Created by Natasha Murashev on 8/16/15.
//  Copyright © 2015 NatashaTheRobot. All rights reserved.
//

import UIKit

protocol SwitchWithTextCellProtocol {
    var title: String { get }
    var switchOn: Bool { get }
    
    func onSwitchTogleOn(on: Bool)
    
    func switchColor() -> UIColor
}

extension SwitchWithTextCellProtocol {
    
    func switchColor() -> UIColor {
        return .purpleColor()
    }
}

class SwitchWithTextTableViewCell: UITableViewCell {

    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var switchToggle: UISwitch!

    private var delegate: SwitchWithTextCellProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(withDelegate delegate: SwitchWithTextCellProtocol) {
        self.delegate = delegate
        
        label.text = delegate.title
        switchToggle.on = delegate.switchOn
        // color option added!
        switchToggle.onTintColor = delegate.switchColor()
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

