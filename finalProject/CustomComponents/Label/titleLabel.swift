//
//  titleLabel.swift
//  finalProject
//
//  Created by QUANG HUNG on 27/Dec/2021.
//

import Foundation
import UIKit

class TitleLabel : UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(){
        self.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setUpLabel(){
        let font = UIFont.boldSystemFont(ofSize: 16.0)
        let attributes :Dictionary = [NSAttributedString.Key.font : font]
        let attrString = NSAttributedString(string: text!, attributes:attributes)
        attributedText = attrString
    }
    
    
}
