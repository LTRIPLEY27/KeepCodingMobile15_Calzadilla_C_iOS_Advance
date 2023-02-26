//
//  HeroViewModel.swift
//  iOS_Advance_practice
//
//  Created by IsaDevs on 18/2/23.
//

import Foundation
import CoreData

class HeroViewModel : NSObject {
    
    private static let allCharacters = "characters"
    
    var apiClient : ApiClient?
    // TRAILING CLOUSURE PARA OBTENER DATOS
    var update: ((_ heroes: [HeroeModel]) -> Void)?
    
    var heroesTable : [Heroe] = []
    
    var heroesOnLocal : [HeroeModel] = []
    var heroeOnLocal : HeroeModel?
    
    //****** to check
    var dataTable : Heroe?
    var responseData = AppDelegate.staticAppDelegate.dataManager.context
    
    // CONSTRUCTOR
    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }
    
    // recibirá el token a alamacenar en el keychain
    func chargeInfo() {
        debugPrint("here is the token ->",tokenLog)
        // CAPTURAMOS EL APICLIENT
        guard let apiClient = self.apiClient else { return }
        
        debugPrint(apiClient)
        debugPrint("here is the token ->",tokenLog)
        // completion del trailing clousures de apiclient con los datos de heroes
        apiClient.getHeroes() { [weak self] heroes, error in
            // retorna el clousure de vuelta con los valores
            //let heroesUp = self?.checkLocations(heroes: heros)
            var heros : [HeroeModel] = []
            let group = DispatchGroup()
            //heroes.forEach{ heroe in
            for heroe in heroes {
                group.enter()
                apiClient.getHeroesLocation(id: heroe.id) { location, error in
                    var hero = heroe
                    if let firtsLocation = location {
                        hero.latitude = Double(firtsLocation.latitude)
                        hero.longitude = Double(firtsLocation.longitude)
                    }
                    else {
                        hero.latitude = 0.0
                        hero.longitude = 0.0
                    }
                    heros.append(hero)
                    debugPrint(heros.count)
                    group.leave()
                }
            }
            group.notify(queue: .main) {
                debugPrint(heros)
                self?.update?(heros)
            }
            
            //self?.update?(self?.checkLocations(heroes: heroes))
            debugPrint("here is the heroes with locations ->",heroes)
        }
    }
    
    //func checkLocations(heroes : [HeroeModel]) -> [HeroeModel]{
    func checkLocations(heroes : [HeroeModel]) -> Void {
        var heros : [HeroeModel] = []
        debugPrint(heroes.count)
        // ES IMPERATIVO QUE LA SUBCONSULTA A LA API SE HAGA EN UN HILO PROPIO, CASO CONTRARIO, RETORNA NULL
        let group = DispatchGroup()
        //heroes.forEach{ heroe in
        for heroe in heroes {
            group.enter()
            apiClient?.getHeroesLocation(id: heroe.id) { location, error in
                var hero = heroe
                if let firtsLocation = location {
                    hero.latitude = Double(firtsLocation.latitude)
                    hero.longitude = Double(firtsLocation.longitude)
                }
                else {
                    hero.latitude = 0.0
                    hero.longitude = 0.0
                }
                heros.append(hero)
                debugPrint(heros.count)
                group.leave()
            }
        }
        group.notify(queue: .main) {
            debugPrint(heros)
        }
        
       // return heros
    }

    // FUNCIONES REFERENTES A LA ALIMENTACIÓN DE DATOS
    func insertToTable(heroes : [HeroeModel]) -> [Heroe]{

        heroes.forEach{hero in
            self.dataTable = Heroe(context: self.responseData)
            guard let dataTable else { return }
            dataTable.id = hero.id
            dataTable.id = hero.id
            dataTable.name = hero.name
            dataTable.descripcion = hero.description
            dataTable.photo = hero.photo
            dataTable.favorite = hero.favorite
            dataTable.latitude = hero.latitude!
            dataTable.longitude = hero.longitude!
            heroesTable.append(dataTable)
        }
        debugPrint("Heroes are in the table!!!")
        AppDelegate.staticAppDelegate.dataManager.saveContext()
   
        return heroesTable
    }
    
    // MAPPEO DE LOS PERSONAJES EN LA TABLA
    func chargeFromData(data : [Heroe]) -> [Heroe] {
        
        data.forEach{ hero in
            heroesTable.append(hero)
        }
        return heroesTable
    }

}

