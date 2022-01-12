//
//  ButtonConfigViewModel.swift
//  finalProject
//
//  Created by QUANG HUNG on 20/Dec/2021.
//

import Foundation

class ButtonConfigViewModel {
    
    var arrButton : Box<[ButtonOption]> = Box([])
    private var getConfigButtonService = ButtonConfigService()
    
    init(){
        fetchButton()
    }
    
    func fetchButton(){
        self.getConfigButtonService.getButtonService { res in
            self.arrButton.value = res
        }
    }
}
