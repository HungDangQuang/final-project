//
//  OptimizeButtonService.swift
//  finalProject
//
//  Created by QUANG HUNG on 03/Jan/2022.
//

import Foundation

class OptimizeButtonService {
    func optimizeButton( buttonText: String?, buttonTextColor: String?, buttonBackgroundColor: String?, buttonWidth: Int?, buttonHeight: Int?, border: Int?, borderDashPattern: String?, borderColor: String?, borderRadius: Int?, leftIcon: String?, rightIcon: String?, tintColor: String?, completion: @escaping(ButtonOption)->()){
        
        let option = ButtonOption(buttonText: buttonText, buttonTextColor: buttonTextColor, buttonBackgroundColor: buttonBackgroundColor, buttonWidth: buttonWidth, buttonHeight: buttonHeight, border: border, borderDashPattern: borderDashPattern, borderColor: borderColor, borderRadius: borderRadius, leftIcon: leftIcon, rightIcon: rightIcon, tintColor: tintColor, iconBackgroundColor: nil)
        
        completion(option)
    }
    
}


