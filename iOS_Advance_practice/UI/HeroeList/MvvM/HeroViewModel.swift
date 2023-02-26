//
//  HeroViewModel.swift
//  iOS_Advance_practice
//
//  Created by IsaDevs on 18/2/23.
//

import Foundation
import CoreData

class HeroViewModel : NSObject {
    
    private var apiClient : ApiClient?
    // TRAILING CLOUSURE PARA OBTENER DATOS
    var update: ((_ heroes: [HeroeModel]) -> Void)?
    
    private var heroesTable : [Heroe] = []
    
    private var heroesOnLocal : [HeroeModel] = []
    private var heroeOnLocal : HeroeModel?
    
    //****** to check
    private var dataTable : Heroe?
    private var responseData = AppDelegate.staticAppDelegate.dataManager.context
    
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
            // llamado a la funcuón que iterará sobre la respuesta realizando operaciones simultáneas al hilo principal
            self?.checkLocations(heroes: heroes)
        }
    }
    
    func checkLocations(heroes : [HeroeModel]) -> Void {
        var heros : [HeroeModel] = []
        // PARA EMULACION DE HILOS Y LLAMADAS SIMULTÁNES, LLAMAMOS A UN DISPATCHGROUP YA QUE SE SALDRÁ DEL HILO PRINCIPAL Y RETORNARÁ VALORES AL MISMO
        let group = DispatchGroup()
        
        guard let apiClient = self.apiClient else { return }
        
        heroes.forEach{ heroe in
            // DEFINICIÓN DE INICIO DEL 'DISPATCH' PARA HACER OPERACIONES SIMULTÁNEAS AL HILO PRINCIPAL
            group.enter()
            
            apiClient.getHeroesLocation(id: heroe.id) { location, error in
                var fullHero = heroe
                if let firstLocation = location.first {
                    fullHero.latitud = Double(firstLocation.latitud)
                    fullHero.longitud = Double(firstLocation.longitud)
                } else {
                    fullHero.latitud = 0.0
                    fullHero.longitud = 0.0
                }
                heros.append(fullHero)
                debugPrint("here is the heroes with locations ->",heroes)
                // DEFINICIÓN DEL CIERRA DE LA OPERACIÓN SIMULTÁNEA
                group.leave()
            }
        }
        // DEFINICIÓN DEL HILO AL QUÉ TORNAR CON EL VALOR DE LA OPERACIÓN
        group.notify(queue: .main) {
            debugPrint(heros)
            self.update?(heros)
        }
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
            dataTable.latitude = hero.latitud!
            dataTable.longitude = hero.longitud!
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

