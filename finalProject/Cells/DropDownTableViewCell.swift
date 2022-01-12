//
//  DropDownTableViewCell.swift
//  finalProject
//
//  Created by QUANG HUNG on 12/Jan/2022.
//

import Foundation
import UIKit

class DropDownTableViewCell: UITableViewCell {
    static let identifier = "DropDownTableViewCell"
    let lblContent = customLabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setUpView(){
        lblContent.translatesAutoresizingMaskIntoConstraints = false
        addSubview(lblContent)
//        self.backgroundColor = .red
    }
    
    func setUpLayout() {
        NSLayoutConstraint.activate([
            lblContent.centerXAnchor.constraint(equalTo: centerXAnchor),
            lblContent.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
