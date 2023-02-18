//
//  LoginViewModel.swift
//  iOS_Advance_practice
//
//  Created by IsaDevs on 17/2/23.
//

import Foundation

class LoginViewModel : NSObject {
    
    // TRAIÑING CLOUSURE QUE VALIDARÁ LOS PARÁMETROS DEL TOKEN
    var checkUser : ((_ token : String, _ error : String) -> Void)?
    
    func userVerified(email : String, password : String) -> Void {
        debugPrint(email)
        debugPrint(password)
        
        ApiClient(token: "").login(user: email, password: password) { [weak self] token, error in
            
            // validamos cada elemento de la consulta
            if let token = token {
                self?.checkUser?(token, "")
                return
            }
            
            if let error = error {
                self?.checkUser?("", error.localizedDescription)
                return
            }
            
            debugPrint(token)
        }
    }
}
