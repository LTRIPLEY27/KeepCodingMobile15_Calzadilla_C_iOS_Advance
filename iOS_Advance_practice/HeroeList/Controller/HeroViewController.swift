//
//  HeroViewController.swift
//  iOS_Advance_practice
//
//  Created by IsaDevs on 18/2/23.
//

import Foundation
import UIKit

class HeroViewController : UIViewController {
    
    // DECLARACIÓN VARIABLES ENLACE
    var mainView : HeroListView { self.view as! HeroListView } // casting de heroelist
    var heroes : [HeroeModel] = [] // clase heroe
    var heroeViewModel : HeroViewModel? // refiere al viewmodel
    private var tableDatasourse : HeroeDataSource?
    private var tableDelegate : HeroeListDelegate?
    
    var login : LoginViewModel?
    var loginController : LoginViewController?
    
    override func loadView() {
        view = HeroListView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        putElementsOnTable()
        //pushTheCell()

        if !isAUserOk() {
            //INSTANCIACIÓN DEL LOGINVIEW CON ÉSTE HEROCONTROLLER PARA CARGA DE DATOS
            loginController = LoginViewController(delegate: self)
            
            if let loginController = loginController {
                loginController.modalPresentationStyle = .fullScreen
                self.navigationController?.present(loginController, animated: true)
            }
            
            return
        }
        
        getValues()
    }
    
    // USO DEL DELEGADO DE LA TABLA PARA POSICIONAR ELEMENTOS
    func putElementsOnTable() {
        tableDelegate = HeroeListDelegate()
        tableDatasourse = HeroeDataSource(tableView: mainView.table)
        mainView.table.dataSource = tableDatasourse
        mainView.table.delegate = tableDelegate
        
    }
    
    // DEFINICIÓN DEL VALOR DE LA CELDA PULSADA
    /*func pushTheCell() {
        tableDelegate?.dipTapOnCell = { [weak self] index in
            // captura del datasource
            guard let datasource = self?.tableDatasourse else { return }
            
            let heroeModel = datasource.heroes[index]
            
            // acá debe de ir el detail !!!!
            //self?.present()
        }
    }**/
    
    func getValues() {
        /*
        heroeViewModel?.update = { [weak self] heros in
            
            if !heros.isEmpty {
                self?.heroes = heros
                self?.tableDatasourse?.set(heroes: heros)
            }

            debugPrint("aca vas  ????")

        }
        /*if let heroeViewModel {
            heroeViewModel.update = { [weak self] heroe in
                self?.heroes = heroe
                self?.tableDatasourse?.set(heroes: heroe)
                debugPrint("aca vas  ????")
            }
            
            heroeViewModel.chargeInfo()
        }*/
        heroeViewModel?.chargeInfo()*/
        let api = ApiClient(token: tokenLog)
        
        heroeViewModel = HeroViewModel(apiClient: api)
        
        heroeViewModel!.update = { [weak self] heros in
            
            if !heros.isEmpty {
                self?.heroes = heros
                self?.tableDatasourse?.set(heroes: heros)
            }

            debugPrint("aca vas  ????")
            
        }
        
        debugPrint("aca vas", heroes)
        heroeViewModel!.chargeInfo()
    }
}

// APLICACIÓN DEL PROTOCOL
extension HeroViewController : LoginDelegate {
    func dismiss() {
        debugPrint("print from protocol")
        DispatchQueue.main.async {
            self.loginController?.dismiss(animated: true)
            self.getValues()
        }
    }
}
