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

    var delegate : LoginDelegate?
    
    init(delegate : LoginDelegate) {
        super.init(nibName: nil, bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // INICIALIZACIÓN DE LOS ELEMENTOS DE LA VISTA
    override func loadView() {
        // jerarquía
        let loginView = LoginView()
        
        email = loginView.getEmail()
        password = loginView.getPasswod()
        button = loginView.getButton()
        
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = LoginViewModel()
        button?.addTarget(self, action: #selector(letIn), for: .touchUpInside)
        
        // uso del debug if
        /*#if DEBUG
        
        email?.text = "isabel.calzadilla.18@gmail.com"
        password?.text = "root"
        
        #endif*/
        
        
        #if DEBUG
        
        email?.text = "pmg@test.com"
        password?.text = "!Test1234"
        
        #endif
    }

    @objc
    func letIn() {
        
        guard let email = email?.text, let password = password?.text else{
            return
        }
        
        viewModel?.checkUser = { [weak self] token, error in
            
            if !token.isEmpty {
                
                // DECLARACION DEL TOKEN COMO GLOBAL PARA RECIBIR LAS LLAMADAS API
                tokenLog = token
                debugPrint("tokenlog" , tokenLog)

                self?.delegate?.dismiss()
                
                return
            }
            
            if !error.isEmpty {
                DispatchQueue.main.async {
                    debugPrint(error)
                }
                
                tokenLog = ""
            }
        }
        
        viewModel?.userVerified(email: email, password: password)
    }
    
    
    }
    
