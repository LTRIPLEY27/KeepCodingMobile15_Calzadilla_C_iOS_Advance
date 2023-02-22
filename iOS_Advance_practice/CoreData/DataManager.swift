//
//  DataManager.swift
//  iOS_Advance_practice
//
//  Created by IsaDevs on 21/2/23.
//

import CoreData

class DataManager {
    
    // VARIBLE INDICATIVA DEL MÓDELO A USAR
    private let model : String
    
    // CONSTRUCTOR
    init(model : String){
        self.model = model
    }
    
    // VARIABLE CONTENEDOR PARA EL MODEL
    private lazy var storeContainer : NSPersistentContainer = {
        
        let container = NSPersistentContainer(name : self.model)
        container.loadPersistentStores{_ , error in
            if let error {
                debugPrint("Error on container")
            }
        }
        
        return container
    }()
    
    // VARIABLE CONTEXTO QUE GESTIONARÁ TODA LA INTERACCIÓN CON EL MODELO PREVIAMNETE CARGADO
    lazy var context : NSManagedObjectContext = self.storeContainer.viewContext

    // función que gestionará todos los cambios en el modelo
    func saveContext() {
        
        guard context.hasChanges else { return }
        
        do {
            try context.save()
        } catch let error as NSError {
            debugPrint("error on the context to save \(error)")
        }
    }
    
}

