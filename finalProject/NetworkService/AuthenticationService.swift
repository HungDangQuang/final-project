//
//  AuthenticationService.swift
//  finalProject
//
//  Created by QUANG HUNG on 10/Jan/2022.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

class AuthenticationService {
    
    func authenticate(email: String, password: String, completion: @escaping(Int, String)->()){
        Auth.auth().signIn(withEmail: email, password: password) { res, err in
            if let err = err {
                print(err.localizedDescription)
                completion(-1, "Wrong email or password")
                return
            }
            if Auth.auth().currentUser != nil {
                completion(1, "Successfully login")
            }
            else {
                completion(-1, "Email or password is wrong")
            }
            return  
        }
    }
    
    func removeChild(completion:@escaping()->()){
        let ref = Database.database().reference()
        ref.child(UIDevice.current.identifierForVendor!.uuidString).removeValue()
    }
}
