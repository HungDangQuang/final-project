//
//  CoreDataService.swift
//  finalProject
//
//  Created by QUANG HUNG on 12/Jan/2022.
//

import Foundation
import CoreData
import UIKit

class CoreDataService {
    
    func save( buttonText: String?, buttonTextColor: String?, buttonBackgroundColor: String?, buttonWidth: Int?, buttonHeight: Int?, border: Int?, borderDashPattern: String?, borderColor: String?, borderRadius: Int?, leftIcon: String?, rightIcon: String?, tintColor: String?){
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
                
        let managedContext = appDelegate.persistentContainer.viewContext
                
        let btn = CustomButton(context: managedContext)
        btn.button_text = buttonText
        btn.button_text_color = buttonTextColor
        btn.button_background_color = buttonBackgroundColor
        btn.button_width = Int16(buttonWidth ?? 0)
        btn.button_height = Int16(buttonHeight ?? 0)
        btn.border = Int16(border ?? 0)
        btn.border_dash_pattern = borderDashPattern
        btn.border_color = borderColor
        btn.border_radius = Int16(borderRadius ?? 0)
        btn.left_icon = leftIcon
        btn.right_icon = rightIcon
        btn.tint_color = tintColor
        do {
                    
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func fetch(completion:@escaping([CustomButton])->()){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        do {
            let arrButton = try managedContext.fetch(CustomButton.fetchRequest())
            completion(arrButton)
        }
        catch {
            print("Could not fetch data")
        }
    }
    
    func delete(button: CustomButton){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        managedContext.delete(button as NSManagedObject)
        
        do {
            try managedContext.save()
        }
        catch {
            
        }
    }
}
