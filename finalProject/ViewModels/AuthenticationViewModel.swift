//
//  AuthenticationViewModel.swift
//  finalProject
//
//  Created by QUANG HUNG on 10/Jan/2022.
//

import Foundation

class AuthenticationViewModel {
    
    var authenticationSerive = AuthenticationService()
    var coreDataService = CoreDataService()
    var firebaseService = FirebaseService()
    init(){
        
    }
    
    func authenticateUser(email: String, password: String, completion:@escaping(Int,String)->()){
        authenticationSerive.authenticate(email: email, password: password) { status, message in
           completion(status,message)
        }
    }
    
    func synData(){
        firebaseService.removeChild {
            self.coreDataService.fetch { res in
                print(res.count)
                self.firebaseService.addChild(arr: res)
            }
        }
    }
    
}
