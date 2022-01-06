//
//  ButtonConfigViewModel.swift
//  finalProject
//
//  Created by QUANG HUNG on 20/Dec/2021.
//

import Foundation

class ButtonConfigViewModel {
    
    var config: Box<[ButtonConfig]> = Box([])
    private var getConfigButtonService = ButtonConfigService()
    
    init(){
        fetchConfig()
    }
    
    func fetchConfig(){
        self.getConfigButtonService.getButtonConfigService { res in
            self.config.value = res
        }
    }
}
