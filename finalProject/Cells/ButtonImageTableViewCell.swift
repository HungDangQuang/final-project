//
//  ButtonImageTableViewCell.swift
//  finalProject
//
//  Created by QUANG HUNG on 12/Jan/2022.
//

import Foundation
import UIKit

class ButtonImageTableViewCell: UITableViewCell {
    static let identifier = "ButtonImageTableViewCell"
    let img = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setUpView(){
        img.translatesAutoresizingMaskIntoConstraints = false
        addSubview(img)
    }
    
    func setUpLayout() {
        NSLayoutConstraint.activate([
            img.centerXAnchor.constraint(equalTo: centerXAnchor),
            img.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
