//
//  ButtonImageViewModel.swift
//  finalProject
//
//  Created by QUANG HUNG on 16/Jan/2022.
//

import Foundation

class ButtonImageViewModel {
    
    var arrButton : Box<[String]> = Box([])
    var buttonImageService = ButtonImageService()
    
    init(){
        getButtonImage()
    }
    
    func getButtonImage(){
        buttonImageService.getButtonImage { res in
            self.arrButton.value = res
        }
    }
}
