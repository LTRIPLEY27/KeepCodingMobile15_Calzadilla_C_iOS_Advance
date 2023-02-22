//
//  HeroViewController.swift
//  iOS_Advance_practice
//
//  Created by IsaDevs on 18/2/23.
//

import Foundation
import UIKit
import CoreData

class HeroViewController : UIViewController {
    
    // DECLARACIÓN VARIABLES ENLACE
    var mainView : HeroListView { self.view as! HeroListView } // casting de heroelist
    var heroes : [HeroeModel] = [] // clase heroe
    var heroeViewModel : HeroViewModel? // refiere al viewmodel
    private var tableDatasourse : HeroeDataSource?
    private var tableDelegate : HeroeListDelegate?
    
    var login : LoginViewModel?
    var loginController : LoginViewController?
    
    // declaración de la variable datamanager para gestionar la base de datos
    //**************************
    var responseData = AppDelegate.staticAppDelegate.dataManager.context
    var dataTable : Heroe?
    
    // VARIABLE INYECTOR DE LA DEPENDENCIA FETCH PARA LA TABLA
    var heroFetch : NSFetchRequest<Heroe>?
    
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
        let api = ApiClient(token: tokenLog)
        
        heroeViewModel = HeroViewModel(apiClient: api)
        
        heroeViewModel!.update = { [weak self] heros in
            
            if !heros.isEmpty {
                self?.heroes = heros
                self?.tableDatasourse?.set(heroes: heros)
                
                // LLAMADA A LA FUNCIÓN PARA INSERTAR LOS DATOS DE LA API A LA TABLA
                self?.insertToTable()
                
                // CARGA DEL FETCH
                self?.heroFetch = Heroe.fetchRequest()
                
                // captura de errore
                do{
                    let result = try self?.responseData.fetch((self?.heroFetch)!)
                    
                    debugPrint("here is the result \n", result)
                    
                } catch let error as NSError {
                    fatalError("Error from the table --> exploiting  \(error)")
                }
            }

            debugPrint("aca vas  ????")
        }
        
        debugPrint("aca vas", heroes)
        heroeViewModel!.chargeInfo()
    }
    
    func insertToTable() {
        
        // to check if a table or not
        self.dataTable = Heroe(context: self.responseData)
        
        for x in heroes {
            //self.dataTable = Heroe(context: self.responseData)
            
            // indicación de las propiedades de la tabla y setteo de las propiedades del model
            self.dataTable?.id = x.id
            self.dataTable?.name = x.name
            self.dataTable?.descripcion = x.description
            self.dataTable?.photo = x.photo
            //self.dataTable?.favorite = x.favorite
            
            // transaction a la datatable para almacenar
            do {
                try self.responseData.save()
            }
            catch let error {
                debugPrint(error)
            }
            
            let x = self.dataTable
            debugPrint("table heroe", x!)
        }
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
