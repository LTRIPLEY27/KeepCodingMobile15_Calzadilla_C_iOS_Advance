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
    
    // MARK : DEFINICIÓN DE LOS COMPONENTES DE LA VISUAL
    let title = {
        let label = UILabel()
        label.text = "API Login"
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        label.textColor = .cyan
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let email  = {
        let textfield = UITextField()
        textfield.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        textfield.text = "Email"
        textfield.backgroundColor = .white
        textfield.borderStyle = .roundedRect
        textfield.textAlignment = .center
        textfield.translatesAutoresizingMaskIntoConstraints = false
        
        return textfield
    }()
    
    let password  = {
        let textfield = UITextField()
        textfield.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        textfield.text = "Password"
        textfield.backgroundColor = .white
        textfield.borderStyle = .roundedRect
        textfield.textAlignment = .center
        textfield.translatesAutoresizingMaskIntoConstraints = false
        
        return textfield
    }()
    
    let buttonCheck = {
        let button = UIButton()
        button.backgroundColor = .red
        button.setTitle("Log In", for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let background = {
        let image = UIImageView()
        image.image = UIImage(named: "dragonBall.jpg")
        image.contentMode = .scaleToFill
        image.alpha = 0.73
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    // función inicializadora de la view
    func startView(){
        
        addSubview(background)
        addSubview(title)
        addSubview(email)
        addSubview(password)
        addSubview(buttonCheck)
        
        
        NSLayoutConstraint.activate([
            
                // CONSTRAINTS DE TITLE
                   title.topAnchor.constraint(equalTo: topAnchor, constant: 150),
                   title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
                   title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
                   title.heightAnchor.constraint(equalToConstant: 40),
                
                   // CONSTRAINTS DE EMAIL TEXTBOX
                   email.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 30),
                   email.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
                   email.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
                   email.heightAnchor.constraint(equalToConstant: 40),
                   email.widthAnchor.constraint(equalToConstant: 200),
                   
                   // CONSTRAINTS DE PASSWORD TEXTBOX
                   password.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 30),
                   password.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
                   password.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
                   password.heightAnchor.constraint(equalToConstant: 40),
                   password.widthAnchor.constraint(equalToConstant: 200),
                   
                   // CONSTRAINTS DE BUTTON TEXTBOX
                   buttonCheck.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 50),
                   buttonCheck.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
                   buttonCheck.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
                   buttonCheck.heightAnchor.constraint(equalToConstant: 40),
                   buttonCheck.widthAnchor.constraint(equalToConstant: 150),
                   
                   // CONSTRAINTS DE BACKGROUNG IMAGEVIEW
                   background.topAnchor.constraint(equalTo: topAnchor, constant: 0),
                   background.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
                   background.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
                   background.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
               ])
    }
    
    
    // GETTERS FUNCTIONS
    
    func getTitle() -> UILabel {
        return title
    }
    
    func getEmail() -> UITextField {
        return email
    }
    
    func getPasswod() -> UITextField {
        return password
    }
    
    func getButton() -> UIButton {
        return buttonCheck
    }
}
