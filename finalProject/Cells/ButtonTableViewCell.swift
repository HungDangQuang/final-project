//
//  ButtonTableViewCell.swift
//  finalProject
//
//  Created by QUANG HUNG on 08/Jan/2022.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {
    static let identifier = "ButtonTableViewCell"
    
    let button = customButton()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
        setUpLayout()
    }
    
    func setUpView(){
        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setUpLayout() {
        NSLayoutConstraint.activate([

            button.centerYAnchor.constraint(equalTo: centerYAnchor),
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),
            
        ])
    }
    
    
}
