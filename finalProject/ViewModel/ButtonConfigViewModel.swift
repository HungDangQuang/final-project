//
//  ButtonConfigViewModel.swift
//  finalProject
//
//  Created by QUANG HUNG on 20/Dec/2021.
//

import Foundation

// #5545DA #8D87F4

class ButtonConfigViewModel {
    
    var config: Box<[ButtonConfig]> = Box([])
    
    var configArr: [ButtonConfig] = [ButtonConfig(leftIconName: nil, rightIconName: "exit3", title: "button", textColor: "#5545DA", backgroundColor: "#8D87F4", iconBackgroundColor: "#8D87F4", iconTintcolor: "#5545DA", border: false, cornerRadius: 5, borderWidth: 0, width: nil, height: nil, isRounded: false, borderColor: nil),
                                     
                                     ButtonConfig(leftIconName: nil, rightIconName: "exit", title: "button", textColor: "#F3F1F9", backgroundColor: "#8D87F4", iconBackgroundColor: "#8D87F4", iconTintcolor: "#F3F1F9", border: false, cornerRadius: 5, borderWidth: 0, width: nil, height: nil, isRounded: false, borderColor: nil),
                                     
                                     ButtonConfig(leftIconName: nil, rightIconName: "exit", title: "button", textColor: "#F3F1F9", backgroundColor: "#8D87F4", iconBackgroundColor: "#5545DA", iconTintcolor: "#FFFFFF", border: false, cornerRadius: 5, borderWidth: 0, width: nil, height: nil, isRounded: false, borderColor: nil),
                                     
                                     ButtonConfig(leftIconName: nil, rightIconName: "cancel", title: "button", textColor: "#F3F1F9", backgroundColor: "#8D87F4", iconBackgroundColor: "#8D87F4", iconTintcolor: "#F3F1F9", border: false, cornerRadius: 5, borderWidth: 0, width: nil, height: nil, isRounded: false, borderColor: nil),
                                     
                                     ButtonConfig(leftIconName: nil, rightIconName: "cancel", title: nil, textColor: nil, backgroundColor: "#4EC2BE", iconBackgroundColor: "#F3F1F9", iconTintcolor: "#4EC2BE", border: true, cornerRadius:0, borderWidth: 1, width: nil, height: nil, isRounded: true, borderColor: "#4EC2BE"),
                                     
                                     ButtonConfig(leftIconName: nil, rightIconName: "exit", title: nil, textColor: nil, backgroundColor: "#4EC2BE", iconBackgroundColor: "#F3F1F9", iconTintcolor: "#4EC2BE", border: false, cornerRadius: 0, borderWidth: 1, width: nil, height: nil, isRounded: true, borderColor: "#4EC2BE"),
                                     
                                     ButtonConfig(leftIconName: nil, rightIconName: "delete", title: nil, textColor: nil, backgroundColor: nil, iconBackgroundColor: "#FFFFFF", iconTintcolor: "#70AAF8", border: true, cornerRadius: 5, borderWidth: 0, width: nil, height: nil, isRounded: false, borderColor: "#70AAF8"),
                                     
                                     ButtonConfig(leftIconName: "less", rightIconName: "greater", title: "button", textColor: "#F3F1F9", backgroundColor: "#4FC3C0", iconBackgroundColor: "#4FC3C0", iconTintcolor: "#F3F1F9", border: false, cornerRadius: 5, borderWidth: 0, width: nil, height: nil, isRounded: false, borderColor: nil),
                                     
                                     ButtonConfig(leftIconName: nil, rightIconName: nil, title: "button", textColor: "#6AA7F6", backgroundColor: "#F3F1F9", iconBackgroundColor: nil, iconTintcolor: nil, border: false, cornerRadius: 5, borderWidth: 2, width: nil, height: nil, isRounded: false, borderColor: "#6AA7F6")
                                     
                                     
    ]
    
    init(){
        fetchConfig()
    }
    
    func fetchConfig(){
        config.value = configArr
    }
}
