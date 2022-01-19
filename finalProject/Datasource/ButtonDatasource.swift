//
//  ButtonDatasource.swift
//  finalProject
//
//  Created by QUANG HUNG on 08/Jan/2022.
//

import Foundation
import UIKit
import CoreData

class ButtonTableViewDataSource<CELL : UITableViewCell,T> : NSObject, UITableViewDataSource {
    
    private var cellIdentifier : String!
    private var items : [T]!
    var configureCell : (CELL, T) -> () = {_,_ in }
    
    
    init(cellIdentifier : String, items : [T], configureCell : @escaping (CELL, T) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.items =  items
        self.configureCell = configureCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CELL
        let item = self.items[indexPath.row]
        self.configureCell(cell, item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let buttonToRemove = self.items[indexPath.row] as! CustomButton
            
            let userDefaults = UserDefaults.standard
            var arrID = userDefaults.object(forKey: "ID") as? [String] ?? []
            
            if buttonToRemove.identifier != nil {
                
                if let index = arrID.firstIndex(of: buttonToRemove.identifier!) {
                    arrID.remove(at: index)
                    userDefaults.set(arrID, forKey: "ID")
                }
                
                var arrayToRemove = userDefaults.object(forKey: "idToRemove") as? [String] ?? []
                arrayToRemove.append(buttonToRemove.identifier!)
                userDefaults.set(arrayToRemove, forKey: "idToRemove")
            }
            
//            if let index = arrID.firstIndex(of: buttonToRemove.identifier!) {
//                arrID.remove(at: index)
//                userDefaults.set(arrID, forKey: "ID")
//            }
//
//            var arrayToRemove = userDefaults.object(forKey: "idToRemove") as? [String] ?? []
//            arrayToRemove.append(buttonToRemove.identifier!)
//            userDefaults.set(arrayToRemove, forKey: "idToRemove")
            
            let buttonListViewModel = ButtonListViewModel()
            buttonListViewModel.deleteButton(button: buttonToRemove)
            
            
            items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}
