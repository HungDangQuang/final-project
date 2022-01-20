//
//  ButtonTableViewCell.swift
//  finalProject
//
//  Created by QUANG HUNG on 08/Jan/2022.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {
    static let identifier = "ButtonTableViewCell"
    
    var button = customButton()
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
        setUpLayout()
    }
    
    override func prepareForReuse() {
        button.title.text = nil
        button.title.textColor = nil
        button.backgroundColor = nil
        button.layer.borderWidth = 0
        button.layer.borderColor = nil
        button.layer.cornerRadius = 0
    
        NSLayoutConstraint.deactivate(button.leftIcon.constraints)
        NSLayoutConstraint.deactivate(button.rightIcon.constraints)
    
        button.removeImage()
        
        for layer in button.layer.sublayers! {
//            print("layer name:\(layer.name)")
             if layer.name == "dash" {
                  layer.removeFromSuperlayer()
             }
         }
    }
    
    func setUpView(){
        contentView.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.title.adjustsFontForContentSizeCategory = true
    }
    
    func setUpLayout() {
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            button.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
        ])
    }
    
}
