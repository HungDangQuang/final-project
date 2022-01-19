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
    
    func save( buttonText: String?, buttonTextColor: String?, buttonBackgroundColor: String?, buttonWidth: Int?, buttonHeight: Int?, border: Int?, borderDashPattern: String?, borderColor: String?, borderRadius: Int?, leftIcon: String?, rightIcon: String?, tintColor: String?, identifier: String?, completion:@escaping()->()){
        
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
        btn.identifier = identifier
        
        do {
                    
            try managedContext.save()
//            let userDefaults = UserDefaults.standard
//            var arrID = userDefaults.object(forKey: "ID") as? [String] ?? []
//            arrID.append(btn.identifier!)
            completion()
//            print(arrID)
            
//            userDefaults.set(arrID, forKey: "ID")
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func fetch(completion:@escaping([CustomButton])->()){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        do {
            let arrButton = try managedContext.fetch(CustomButton.fetchRequest())
//            print(arrButton[0])
            completion(arrButton)
        }
        catch {
            print("Could not fetch data")
        }
    }
    
    func fetchButtonWithCondition(condition: String,completion: @escaping([CustomButton])->()){
        
        let request: NSFetchRequest<CustomButton> = CustomButton.fetchRequest()
        request.predicate = NSPredicate(format: "identifier == %@", condition)
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext

        
        do {
            let button = try managedContext.fetch(request)
            completion(button)
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
    
    
    func deleteAllData()
    {
        fetch { res in
            for element in res {
                self.delete(button: element)
            }
        }
    }
}
