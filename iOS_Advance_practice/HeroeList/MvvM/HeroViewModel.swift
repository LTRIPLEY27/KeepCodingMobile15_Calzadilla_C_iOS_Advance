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
    
    // CONSTRUCTOR
    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }
    
    func chargeInfo() {
        
        // CAPTURAMOS EL APICLIENT
        guard let apiClient = self.apiClient else { return }
        
        debugPrint(apiClient)
        // completion del trailing clousures de apiclient con los datos de heroes
        apiClient.getHeroes { [weak self] heroes, error in
            self?.update?(heroes)
            
        }
    }
}
