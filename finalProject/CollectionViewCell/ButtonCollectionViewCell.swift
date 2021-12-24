//
//  ButtonCollectionViewCell.swift
//  finalProject
//
//  Created by QUANG HUNG on 20/Dec/2021.
//

import UIKit

class ButtonCollectionViewCell: UICollectionViewCell {
    static let identifier = "ButtonCollectionViewCell"
    
    let button = customButton()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setUpView()
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){
        button.translatesAutoresizingMaskIntoConstraints = false
        addSubview(button)
//        self.backgroundColor = .red
    }
    
    func setUpLayout() {
        NSLayoutConstraint.activate([
//            button.widthAnchor.constraint(equalTo: self.widthAnchor),
//            button.heightAnchor.constraint(equalTo: self.heightAnchor),
//            button.centerXAnchor.constraint(equalTo: centerXAnchor),
//            button.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            button.topAnchor.constraint(equalTo: self.topAnchor)
        ])
    }
}
