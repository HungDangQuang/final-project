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
            
            if status == 1 {
                UserDefaults.standard.set(1, forKey: "Status")
            }
            
           completion(status,message)
        }
    }
    
    func syncData(){
//        firebaseService.removeChild {
//            self.coreDataService.fetch { res in
//                print(res.count)
//                self.firebaseService.addChild(arr: res)
//            }
//        }
        let userDefaults = UserDefaults.standard
        
        let arrayToRemove = userDefaults.object(forKey: "idToRemove") as? [String] ?? []
        let emptyArr:[String] = []
        userDefaults.set(emptyArr, forKey: "idToRemove")
        
        for element in arrayToRemove {
            print(element)
            self.firebaseService.removeChild(childName: element)
        }
        
        let arrID = userDefaults.object(forKey: "ID") as? [String] ?? []
        userDefaults.set(emptyArr, forKey: "ID")

        for element in arrID {
            self.coreDataService.fetchButtonWithCondition(condition: element) { res in
                self.firebaseService.addChild(arr: res)
            }
        }
        
        self.coreDataService.deleteAllData()
        
        self.firebaseService.fetchData()
        
    
    }
    
    
    
}
