//
//  SaveKeys.swift
//  iOS_Advance_practice
//
//  Created by IsaDevs on 25/2/23.
//

import Foundation
import Security
import UIKit

final class SaveKeys {
    
    static let keys = SaveKeys()
    
    init(){
        
    }
    
    // RECIBE EL EMAIL Y ALMACENA EL TOKEN
    func tokenCheck(email : String) -> String {
        
        var myToken = ""
        //QUERY PARA EVALUAR SI EL TOKEN TIENE O NO VALOR
        let query : [String : Any] = [
            kSecClass as String : kSecClassGenericPassword,
            kSecAttrAccount as String : email,
            kSecMatchLimit as String : kSecMatchLimitOne,
            kSecReturnAttributes as String : true,
            kSecReturnData as String : true
        ]
        
        debugPrint("El valor por primera vez del token es ")
        
        // inciializamos un valor para enviar por parámetro
        var item : CFTypeRef?
        
        if SecItemCopyMatching(query as CFDictionary, &item) == noErr {
            
            if let existedToken = item as? [String : Any],
               let token = existedToken[kSecValueData as String] as? Data,
               let tokin = String(data: token, encoding: .utf8) {
                
                myToken = tokin
                debugPrint("Token almacenado, valor  ------>   \(myToken)")
            }
        }
        
        return myToken
    }
    
    // FUNCIÓN DE ALMACENAJE EN LA KEYCHAIN DE LOS VALORES QUE DFINAMOS
    func tokenSave(token : String, email : String) {
        let email = email
        let myToken = token.data(using: .utf8)
        
        // DEFINIMOS LOS ATRIBUTOS KEYCHAIN PARA PREPARAR LA DATA
        let atributes : [String : Any] = [
            kSecClass as String : kSecClassGenericPassword,
            kSecAttrAccount as String : email, //---> ATRIBUTOS DEL DICCIONARIO Y QUE SON RELATIVOS A LAS VARIABLES A ALAMACENAR
            kSecValueData as String : myToken ?? ""
            
        ]
        
        if SecItemAdd(atributes as CFDictionary, nil) == noErr {
            debugPrint("Sus credenciales han sido satisfactoriamente almacenadas \(token)")
        } else {
            debugPrint("Sus credenciales NO han sido satisfactoriamente almacenadas \(token)")
        }
    }
    
    func deleteToken(email : String){
        let email = email
        
        // DEFINICIÓN D ELA QUERY
        let query : [String : Any] = [
            kSecClass as String : kSecClassGenericPassword, // internet password???
            kSecAttrAccount as String : email
        ]
        
        if(SecItemDelete(query as CFDictionary)) == noErr {
            debugPrint("Sayonara!!!")
        }
        else {
            debugPrint("No se ha podido borrar sus credenciales")
        }
    }

    
}
