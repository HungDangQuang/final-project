//
//  ButtonListModel.swift
//  finalProject
//
//  Created by QUANG HUNG on 08/Jan/2022.
//

import Foundation
//import CoreData
//import UIKit

class ButtonListViewModel {
    var arrButton: Box<[CustomButton]> = Box([])
    var coreDataService = CoreDataService()
    
    init(){
        getListOfButtons()
    }
    
    func getListOfButtons(){
        self.coreDataService.fetch { res in
            self.arrButton.value = res
        }
    }
    
    func deleteButton(button: CustomButton){
        coreDataService.delete(button: button)
    }
    
}
