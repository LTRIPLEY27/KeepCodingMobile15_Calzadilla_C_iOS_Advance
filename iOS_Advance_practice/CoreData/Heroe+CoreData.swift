//
//  Heroe+CoreData.swift
//  iOS_Advance_practice
//
//  Created by IsaDevs on 22/2/23.
//

import Foundation
import CoreData

// las entidades a mappear han de heredar de la interface 'NSManaged'
@objc(Heroe)
final class Heroe : NSManagedObject {

}

extension Heroe  {

    // '@NSManaged' --> Indica que es una propiedad gestionada
    @NSManaged var id : String
    @NSManaged var name : String
    @NSManaged var descripcion : String
    @NSManaged var photo : String?
    @NSManaged var favorite: Bool
    @NSManaged var latitude : Double
    @NSManaged var longitude : Double
    
    @nonobjc class func fetchRequest() -> NSFetchRequest<Heroe> {
        NSFetchRequest<Heroe>(entityName: "Heroe")
    }
}

// traduce el valor de la tabla a la entidad
extension Heroe : Identifiable {}


