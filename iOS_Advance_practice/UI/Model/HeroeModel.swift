//
//  HeroeModel.swift
//  iOS_Advance_practice
//
//  Created by IsaDevs on 18/2/23.
//

import Foundation

struct HeroeModel : Codable {
    var id : String
    var name : String
    var photo : String?
    var description : String
    var favorite : Bool
    var latitud : Double?
    var longitud : Double?
}
