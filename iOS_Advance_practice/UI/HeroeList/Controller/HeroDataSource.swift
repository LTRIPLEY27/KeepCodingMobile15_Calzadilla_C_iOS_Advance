//
//  HeroDataSource.swift
//  iOS_Advance_practice
//
//  Created by IsaDevs on 18/2/23.
//

import Foundation
import UIKit

class HeroeDataSource : NSObject, UITableViewDataSource {
    
    private let tableView : UITableView
    
    // VARIABLE DECLARADA CON SETTER
    private(set) var heroes : [Heroe] = [] {
        didSet {
            // CON CADA SETTER ACTUALIZA EL HILO PRINCIPAL
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // constructores
    init(tableView : UITableView, heroes : [Heroe] = []) {
        self.tableView = tableView
        self.heroes = heroes
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        heroes.count
    }
      
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! HeroeCell
        
        let hero = heroes[indexPath.row]
        
        cell.putElementsOnView(hero)
        
        return cell
    }
     
    func set(heroes : [Heroe]) {
        self.heroes = heroes
    }
}
