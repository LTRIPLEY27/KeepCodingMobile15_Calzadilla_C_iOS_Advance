//
//  HeroListView.swift
//  iOS_Advance_practice
//
//  Created by IsaDevs on 18/2/23.
//

import Foundation
import UIKit

class HeroListView : UIView {
    
    // DEFINICIÓN DE LOS ATRIBUTOS DE LA VISTA
    let title = {
       let label = UILabel()
        label.text = "Dragon Ball Characters"
        label.font = .boldSystemFont(ofSize: 32)
        label.textAlignment = .center
        label.textColor = .red
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let table = {
       let table = UITableView()
        
    }()
}
