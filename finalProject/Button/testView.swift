//
//  testView.swift
//  finalProject
//
//  Created by QUANG HUNG on 13/Dec/2021.
//

import Foundation
import UIKit

class testView: UIView{
    
    override init(frame: CGRect){
        super.init(frame: frame)
        backgroundColor = .brown
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init() {
        self.init(frame: .zero)
    }
}
