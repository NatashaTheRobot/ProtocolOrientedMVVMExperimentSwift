//
//  SwitchWithTextTableViewCell.swift
//  MVVMProtocolExperiment
//
//  Created by Natasha Murashev on 8/16/15.
//  Copyright © 2015 NatashaTheRobot. All rights reserved.
//

import UIKit

protocol TextPresentable {
    var text: String { get }
    var textColor: UIColor { get }
    var font: UIFont { get }
}

protocol SwitchPresentable {
    var switchOn: Bool { get }
    var switchColor: UIColor { get }
    func onSwitchToggleOn(_ on: Bool)
}

extension SwitchPresentable {
    var switchColor: UIColor {
        return UIColor.yellow
    }
}

protocol ImagePresentable {
    var imageName: String { get }
}

protocol TextFieldPresentable {
    var placeholder: String { get }
    var text: String { get }
    
    func onTextFieldDidEndEditing(textField: UITextField)
}

typealias SwitchWithTextViewPresentable = TextPresentable & SwitchPresentable

class SwitchWithTextTableViewCell: UITableViewCell {
    
    @IBOutlet fileprivate weak var label: UILabel!
    @IBOutlet fileprivate weak var switchToggle: UISwitch!
    
    fileprivate var delegate: SwitchWithTextViewPresentable?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(presenter: SwitchWithTextViewPresentable) {
        delegate = presenter
        
        //configure UI component
        label.text = presenter.text
        switchToggle.isOn = presenter.switchOn
    }
    
    @IBAction func onSwitchToggle(_ sender: UISwitch) {
        delegate?.onSwitchToggleOn(sender.isOn)
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

