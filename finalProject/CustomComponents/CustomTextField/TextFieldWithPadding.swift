//
//  TextFieldWithPadding.swift
//  finalProject
//
//  Created by QUANG HUNG on 12/Jan/2022.
//

import Foundation
import UIKit

class TextFieldWithPadding: UITextField {

    var textPadding = UIEdgeInsets(
        top: 15,
        left: 15,
        bottom: 15,
        right: 15
    )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        setUpTextField()
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(){
        self.init(frame: .zero)
    }
    
    func setUpTextField(){
        borderStyle = .line
        backgroundColor = .white
        layer.borderWidth = 1
        layer.borderColor = hexStringToCGColor(hex: "#DADADA")
        font = UIFont.systemFont(ofSize: 15)
//        translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
    
}
