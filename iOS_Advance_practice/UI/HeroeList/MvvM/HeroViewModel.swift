//
//  HeroViewModel.swift
//  iOS_Advance_practice
//
//  Created by IsaDevs on 18/2/23.
//

import Foundation

class HeroViewModel : NSObject {
    
    private static let allCharacters = "characters"
    
    var apiClient : ApiClient?
    // TRAILING CLOUSURE PARA OBTENER DATOS
    var update: ((_ heroes: [HeroeModel]) -> Void)?
    
    var heroesTable : [Heroe] = []
    
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
            self?.update?(heroes)
            
            //heroesTable = heroes
            
            debugPrint(heroes)
            
            debugPrint("here is the token ->",tokenLog)
        }
    }
    

    // FUNCIONES REFERENTES A LA ALIMENTACIÓN DE DATOS
    func insertToTable(heroes : [HeroeModel]) {
        
        // to check if a table or not
        self.dataTable = Heroe(context: self.responseData)
        
        heroes.forEach{hero in
            
            guard let dataTable else { return }
            dataTable.id = hero.id
            dataTable.id = hero.id
            dataTable.name = hero.name
            dataTable.descripcion = hero.description
            dataTable.photo = hero.photo
            //dataTable?.favorite = hero.favorite
            heroesTable.append(dataTable)
        }
        debugPrint("Heroes are in the table!!!")
        AppDelegate.staticAppDelegate.dataManager.saveContext()
   
    }
    
    func chargeFromData() {
        
    }
    // FUNCIÓN DE ALMACENAJE DE LOS REGISTROS EN LA DATALOCAL
   /* func charactersOnLocal <T : Codable>() -> [T] {
        // USO DE LOS USER DEFAULTS PARA REALIZAR LA CONSULTA
        if let addCharacter = UserDefaults.standard.object(forKey: Self.allCharacters) as? Data {
            do {
                let saveCharacter = try JSONDecoder().decode([T].self, from: addCharacter)
                return saveCharacter
            }
            catch
            {
                print("Error adding data to local")
                return []
            }
        } else {
                return []
                }
    }*/
}

