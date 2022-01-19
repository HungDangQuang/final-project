//
//  ButtonOptionViewModel.swift
//  finalProject
//
//  Created by QUANG HUNG on 03/Jan/2022.
//

import Foundation
import CoreData
import UIKit

class ButtonOptionViewModel {
    private var buttonOption: OptimizeButtonService!
    private var coreDataService:CoreDataService!
    
    init(){
        buttonOption = OptimizeButtonService()
        coreDataService = CoreDataService()
    }
    
    func updateButton( buttonText: String?, buttonTextColor: String?, buttonBackgroundColor: String?, buttonWidth: Int?, buttonHeight: Int?, border: Int?, borderDashPattern: String?, borderColor: String?, borderRadius: Int?, leftIcon: String?, rightIcon: String?, tintColor: String?, completion: @escaping(ButtonOption)->()){
        
        self.buttonOption.optimizeButton(buttonText: buttonText, buttonTextColor: buttonTextColor, buttonBackgroundColor: buttonBackgroundColor, buttonWidth: buttonWidth, buttonHeight: buttonHeight, border: border, borderDashPattern: borderDashPattern, borderColor: borderColor, borderRadius: borderRadius, leftIcon: leftIcon, rightIcon: rightIcon, tintColor: tintColor) { res in
            
            completion(res)
            
        }
    }
    
    func saveButtonConfig( buttonText: String?, buttonTextColor: String?, buttonBackgroundColor: String?, buttonWidth: Int?, buttonHeight: Int?, border: Int?, borderDashPattern: String?, borderColor: String?, borderRadius: Int?, leftIcon: String?, rightIcon: String?, tintColor: String?, completion:@escaping()->()){
        
        let identifier = UUID().uuidString
        
        coreDataService.save(buttonText: buttonText, buttonTextColor: buttonTextColor, buttonBackgroundColor: buttonBackgroundColor, buttonWidth: buttonWidth, buttonHeight: buttonHeight, border: border, borderDashPattern: borderDashPattern, borderColor: borderColor, borderRadius: borderRadius, leftIcon: leftIcon, rightIcon: rightIcon, tintColor: tintColor, identifier: identifier) {
            
            let userDefaults = UserDefaults.standard
            var arrID = userDefaults.object(forKey: "ID") as? [String] ?? []
            arrID.append(identifier)
            userDefaults.set(arrID, forKey: "ID")
            
        }
        
        completion()
    }
}
