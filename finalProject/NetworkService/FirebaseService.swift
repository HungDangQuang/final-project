//
//  FirebaseService.swift
//  finalProject
//
//  Created by QUANG HUNG on 12/Jan/2022.
//

import Foundation
import FirebaseDatabase

class FirebaseService{
    
    func removeChild(completion:@escaping()->()){
        let ref = Database.database().reference()
        ref.child(UIDevice.current.identifierForVendor!.uuidString).removeValue()
        completion()
    }
    
    func addChild(arr: [CustomButton]){
        let ref = Database.database().reference()
        var count = 0
        for element in arr {
            let buttonRef = ref.child(UIDevice.current.identifierForVendor!.uuidString).child("Button\(count)")
                count += 1
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
                "rightIcon" : element.right_icon
            ]
            buttonRef.setValue(object)
        }
    }
}
