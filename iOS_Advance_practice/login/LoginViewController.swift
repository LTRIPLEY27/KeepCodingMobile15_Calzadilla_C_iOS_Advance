//
//  LoginViewController.swift
//  iOS_Advance_practice
//
//  Created by IsaDevs on 17/2/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    var mainView: LoginView {self.view as! LoginView}
    var viewModel : LoginViewModel?
    //var title : UILabel?
    var email : UITextField?
    var password : UITextField?
    var button : UIButton?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // INICIALIZACIÓN DE LOS ELEMENTOS DE LA VISTA
    override func loadView() {
        // jerarquía
        let loginView = LoginView()
        
        //title = loginView.getTitle()
        email = loginView.getEmail()
        password = loginView.getPasswod()
        button = loginView.getButton()
        
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = LoginViewModel()
        button?.addTarget(self, action: #selector(letIn), for: .touchUpInside)
    }

    @objc
    func letIn() {
        
        guard let email = email?.text, let password = password?.text else{
            return
        }
        
        viewModel?.checkUser = { [weak self] token, error in
            
            if !token.isEmpty {
                DispatchQueue.main.async {
                    debugPrint(token)
                }
            }
            
            if !error.isEmpty {
                DispatchQueue.main.async {
                    debugPrint(error)
                }
            }
        }
        
        viewModel?.userVerified(email: email, password: password)
    }
    
    
    }
    
