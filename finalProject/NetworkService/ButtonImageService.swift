//
//  ButtonImageService.swift
//  finalProject
//
//  Created by QUANG HUNG on 16/Jan/2022.
//

import Foundation

class ButtonImageService {
    func getButtonImage(completion:@escaping([String])->()){
        
        let arrButtonImage = ["close-button", "dropdown"]
        
        completion(arrButtonImage)
    }
}
