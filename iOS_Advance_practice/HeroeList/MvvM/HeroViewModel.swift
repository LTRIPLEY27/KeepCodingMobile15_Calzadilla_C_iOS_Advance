//
//  HeroViewModel.swift
//  iOS_Advance_practice
//
//  Created by IsaDevs on 18/2/23.
//

import Foundation

class HeroViewModel : NSObject {
    
    var apiClient : ApiClient?
    // TRAILING CLOUSURE PARA OBTENER DATOS
    var update: ((_ heroes: [HeroeModel]) -> Void)?
    //var update: ((_ heroes: [HeroeModel]) -> [HeroeModel])?
    

    
    // CONSTRUCTOR
    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }
    
    func chargeInfo() {
        debugPrint("here is the token ->",tokenLog)
        // CAPTURAMOS EL APICLIENT
        guard let apiClient = self.apiClient else { return }
        
        debugPrint(apiClient)
        debugPrint("here is the token ->",tokenLog)
        // completion del trailing clousures de apiclient con los datos de heroes
        apiClient.getHeroes() { [weak self] heroes, error in
            //self?.update?(heroes ?? [])

            self?.update?(heroes)
            
            debugPrint(heroes)
            //self?.update?([])
            
            debugPrint("here is the token ->",tokenLog)
        }
    }
    
    //func save<T : Encodable>(heroes : [HeroeModel]){
        
    //}
    
}

