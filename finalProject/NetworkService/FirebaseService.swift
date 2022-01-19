//
//  FirebaseService.swift
//  finalProject
//
//  Created by QUANG HUNG on 12/Jan/2022.
//

import Foundation
import FirebaseDatabase

class FirebaseService{
    
    func removeChild(childName: String){
        let ref = Database.database().reference()
        ref.child(childName).removeValue()
    }
    
    func addChild(arr: [CustomButton]){
        let ref = Database.database().reference()
        for element in arr {
            let buttonRef = ref.child(element.identifier!)
                let object : [String : Any] = [
                "buttonText" : element.button_text,
                "buttonTextColor" : element.button_text_color,
                "buttonBackgroundColor" : element.button_background_color,
                "buttonWidth" : element.button_width,
                "buttonHeight": element.button_height,
                "border": element.border,
                "borderDashPattern" : element.border_dash_pattern,
                "borderColor" : element.border_color,
                "borderRadius" : element.border_radius,
                "leftIcon" : element.left_icon,
                "rightIcon" : element.right_icon,
                "tintColor" : element.tint_color,
                "id" : element.identifier,
            ]
            buttonRef.setValue(object)
        }
    }
    
    func fetchData(){
        let ref = Database.database().reference()
    
        ref.observeSingleEvent(of: .value) { snapshot in
            let allUidSnaps = snapshot.children.allObjects as! [DataSnapshot]
            for element in allUidSnaps {
 
                var bgColor: String?
                var txt : String?
                var txtColor : String?
                var width : Int?
                var height : Int?
                var border : Int?
                var borderDashPattern : String?
                var borderColor : String?
                var borderRadius : Int?
                var leftIcon : String?
                var rightIcon : String?
                var tintColor : String?
                var identitifer : String?
                
                if let bg = element.childSnapshot(forPath: "buttonBackgroundColor").value! as? String {
                    bgColor = bg
                }
                
                if let btnTxt = element.childSnapshot(forPath: "buttonText").value! as? String {
                    txt = btnTxt
                }
                
                if let btnTxtColor = element.childSnapshot(forPath: "buttonTextColor").value! as? String {
                    txtColor = btnTxtColor
                }
                
                if let btnWidth = element.childSnapshot(forPath: "buttonWidth").value! as? Int {
                    width = btnWidth
                }
                
                if let btnHeight = element.childSnapshot(forPath: "buttonHeight").value! as? Int {
                    height = btnHeight
                }
                
                if let btnBorder = element.childSnapshot(forPath: "border").value! as? Int {
                    border = btnBorder
                }
                
                if let btnDashPattern = element.childSnapshot(forPath: "borderDashPattern").value! as? String {
                    borderDashPattern = btnDashPattern
                }
                
                if let btnBorderColor = element.childSnapshot(forPath: "borderColor").value! as? String {
                    borderColor = btnBorderColor
                }
                
                if let btnBorderRadius = element.childSnapshot(forPath: "borderRadius").value! as? Int {
                    borderRadius = btnBorderRadius
                }
                
                if let btnLeftIcon = element.childSnapshot(forPath: "leftIcon").value! as? String {
                    leftIcon = btnLeftIcon
                }
                
                if let btnRightIcon = element.childSnapshot(forPath: "rightIcon").value! as? String {
                    rightIcon = btnRightIcon
                }
                
                if let iconTintColor = element.childSnapshot(forPath: "tintColor").value! as? String {
                    tintColor = iconTintColor
                }

                if let id = element.childSnapshot(forPath: "id").value! as? String {
                    identitifer = id
                }
                
                let coreDataService = CoreDataService()
                
                coreDataService.save(buttonText: txt, buttonTextColor: txtColor, buttonBackgroundColor: bgColor, buttonWidth: width, buttonHeight: height, border: border, borderDashPattern: borderDashPattern, borderColor: borderColor, borderRadius: borderRadius, leftIcon: leftIcon, rightIcon: rightIcon, tintColor: tintColor, identifier: identitifer) {
                    print("Ok")
                }
                
            }
                

        }
            
    }
}

    

