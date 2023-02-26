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
    var heroesTable : [Heroe] = [] // clase heroe
    
    //enlaces a viewmodel
    var heroeViewModel : HeroViewModel? // refiere al viewmodel
    private var tableDatasourse : HeroeDataSource?
    private var tableDelegate : HeroeListDelegate?
    
    //enlace con login
    var login : LoginViewModel?
    var loginController : LoginViewController?

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
        //let action = UITapGestureRecognizer(target: self, action: #selector(push(_:)))
        mainView.button.addTarget(self, action: #selector(push), for: .touchUpInside)
        putElementsOnTable()
        pushTheCell()
        

        //mainView.button.addTarget(self, action: #selector(push), for: .touchUpInside)

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
    func pushTheCell() {
        
        tableDelegate?.dipTapOnCell = { [weak self] index in
            // captura del datasource
            guard let datasource = self?.tableDatasourse else { return }
            
            let heroeModel = datasource.heroes[index]
            let detail = HeroeDetailController()
            detail.detail.putElementsOnView(heroeModel)
            
            self?.navigationController?.pushViewController(detail, animated: true)
            
        }
    }
    
    func getValues() {
        
        let api = ApiClient(token: tokenLog)
        
        heroeViewModel = HeroViewModel(apiClient: api)
        
        guard let heroeViewModel else { return }
        // CARGA DEL FETCH PARA VERIFICAR SI HAY DATOS INSERTADOS YA EN LA TABLA O EJECUTAR UN REQUEST A LA API
        self.heroFetch = Heroe.fetchRequest()
        
        // captura de errores y validación de valores en la tabla
        do{
            let result = try self.responseData.fetch((self.heroFetch)!)
            debugPrint("hay tantos RESULTS --> ", result.count)
            
            if result.isEmpty {
                // REFERENCIA Y VALIDACIÓN D ELOS VALORES DEL TRAINLING CLOUSURE DE HEROMODEL
                heroeViewModel.update = { [weak self] heros in
                    
                    if !heros.isEmpty {
                        
                        guard let self else { return }
                        
                        self.heroes = heros
                        // LLAMADA A LA FUNCIÓN PARA INSERTAR LOS DATOS DE LA API A LA TABLA
                        var heroesFromTable =  self.heroeViewModel?.insertToTable(heroes : self.heroes)
                        
                        self.tableDatasourse?.set(heroes: heroesFromTable!)
                        
                        debugPrint(self.heroes)
                        // CARGA DEL FETCH
                        self.heroFetch = Heroe.fetchRequest()
                    }

                    debugPrint("DESDE EL API FETCH ESTÁ MAL!!!")
                }
            }
            else {
                var heroesFromTable =  self.heroeViewModel?.chargeFromData(data: result)
                
                self.tableDatasourse?.set(heroes: heroesFromTable!)
                debugPrint("from data --> " ,heroes)
            }

        heroeViewModel.chargeInfo()
        debugPrint("here is the result \n", result)
        
    } catch let error as NSError {
        fatalError("Error from the table --> exploiting  \(error)")
    }
}
    
    @objc
    func push(){
        debugPrint("Bye bye")
        //self.dismiss()
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
