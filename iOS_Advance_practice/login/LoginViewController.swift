//
//  LoginViewController.swift
//  iOS_Advance_practice
//
//  Created by IsaDevs on 17/2/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    var mainView: LoginView {self.view as! LoginView}
    
    var login : UILabel?
    

    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func loadView() {
        let loginView = LoginView()
        
        login = loginView.title
        
        view = loginView
    }

    }
    
