//
//  GetButtonConfigService.swift
//  finalProject
//
//  Created by QUANG HUNG on 24/Dec/2021.
//

import Foundation

class ButtonConfigService: NSObject {
    
    func getButtonService(completionHandler: @escaping([ButtonOption])->()){
        
        let configArr : [ButtonOption] = [ButtonOption(buttonText: "Button", buttonTextColor: "#5545DA", buttonBackgroundColor: "#8D87F4", buttonWidth: nil, buttonHeight: nil, border: nil, borderDashPattern: nil, borderColor: nil, borderRadius: 5, leftIcon: nil, rightIcon: "exit3", tintColor: "#5545DA", iconBackgroundColor: "#8D87F4"),
                                          
            ButtonOption(buttonText: "Button", buttonTextColor: "#F3F1F9", buttonBackgroundColor: "#8D87F4", buttonWidth: nil, buttonHeight: nil, border: nil, borderDashPattern: nil, borderColor: nil, borderRadius: 5, leftIcon: nil, rightIcon: "exit", tintColor: "#F3F1F9", iconBackgroundColor: nil),
        
            ButtonOption(buttonText: "Button", buttonTextColor: "#F3F1F9", buttonBackgroundColor: "#8D87F4", buttonWidth: nil, buttonHeight: nil, border: nil, borderDashPattern: nil, borderColor: nil, borderRadius: 5, leftIcon: nil, rightIcon: "cancel", tintColor: "#FFFFFF", iconBackgroundColor: nil),
            
            ButtonOption(buttonText: "Button", buttonTextColor: "#F3F1F9", buttonBackgroundColor: "#8D87F4", buttonWidth: nil, buttonHeight: nil, border: nil, borderDashPattern: nil, borderColor: nil, borderRadius: 5, leftIcon: nil, rightIcon: "exit", tintColor: "#F3F1F9", iconBackgroundColor: "#5545DA"),
        
            ButtonOption(buttonText: nil, buttonTextColor: nil, buttonBackgroundColor: "#4EC2BE", buttonWidth: nil, buttonHeight: nil, border: nil, borderDashPattern: nil, borderColor: nil, borderRadius: 22, leftIcon: "cancel", rightIcon: nil, tintColor: "#4EC2BE", iconBackgroundColor: "#F3F1F9"),
            
            ButtonOption(buttonText: nil, buttonTextColor: nil, buttonBackgroundColor: "#4EC2BE", buttonWidth: nil, buttonHeight: nil, border: nil, borderDashPattern: nil, borderColor: nil, borderRadius: 22, leftIcon: "exit", rightIcon: nil, tintColor: "#4EC2BE", iconBackgroundColor: "#F3F1F9"),
            ButtonOption(buttonText: nil, buttonTextColor: nil, buttonBackgroundColor: "#FFFFFF", buttonWidth: nil, buttonHeight: nil, border: nil, borderDashPattern: "6,3", borderColor: "#70AAF8", borderRadius: 5, leftIcon: "delete", rightIcon: nil, tintColor: "#70AAF8", iconBackgroundColor: "#FFFFFF"),
        
            ButtonOption(buttonText: "Button", buttonTextColor: "#F3F1F9", buttonBackgroundColor: "#4FC3C0", buttonWidth: nil, buttonHeight: nil, border: nil, borderDashPattern: nil, borderColor: nil, borderRadius: 5, leftIcon: "less", rightIcon: "greater", tintColor: "#F3F1F9", iconBackgroundColor: nil),
        
            ButtonOption(buttonText: "Button", buttonTextColor: "#6AA7F6", buttonBackgroundColor: "#F3F1F9", buttonWidth: nil, buttonHeight: nil, border: 1, borderDashPattern: nil, borderColor: "#6AA7F6", borderRadius: 5, leftIcon: nil, rightIcon: nil, tintColor: nil, iconBackgroundColor: nil)]
        
        completionHandler(configArr)
    }
}
