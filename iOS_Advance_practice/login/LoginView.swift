//
//  LoginView.swift
//  iOS_Advance_practice
//
//  Created by IsaDevs on 17/2/23.
//
/*  *************************************************************
 
                            Vista Login
 
    *************************************************************
            Resum :
 
    - Propiedades de la vista del login
 
 */
//

import Foundation
import UIKit

class LoginView : UIView {
    
    // MARK : DEFINICIÓN DEL CONSTRUCTOR
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        startView()
    }
    
    required init?(coder : NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    let title = {
        let label = UILabel()
        label.text = "API Login"
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let email  = {
        let textfield = UITextField()
        textfield.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        textfield.text = "Email"
        textfield.textAlignment = .center
        textfield.translatesAutoresizingMaskIntoConstraints = false
        
        return textfield
    }()
    
    let password  = {
        let textfield = UITextField()
        textfield.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        textfield.text = "Email"
        textfield.textAlignment = .center
        textfield.translatesAutoresizingMaskIntoConstraints = false
        
        return textfield
    }()
    // función inicializadora de la view
    func startView(){
        backgroundColor = .cyan
        
        addSubview(title)
        addSubview(email)
        
        NSLayoutConstraint.activate([
                   title.topAnchor.constraint(equalTo: topAnchor, constant: 150),
                   title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
                   title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
                   title.heightAnchor.constraint(equalToConstant: 40),
                   
                   email.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 30),
                   email.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
                   email.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
                   email.heightAnchor.constraint(equalToConstant: 30),
                   email.widthAnchor.constraint(equalToConstant: 200),
                   
               ])
    }
}
