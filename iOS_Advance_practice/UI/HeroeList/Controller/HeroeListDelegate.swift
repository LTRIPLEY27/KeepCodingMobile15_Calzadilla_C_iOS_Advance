//
//  HeroeListDelegate.swift
//  iOS_Advance_practice
//
//  Created by IsaDevs on 18/2/23.
//

import Foundation
import UIKit

class HeroeListDelegate : NSObject, UITableViewDelegate {
    
    // DEFINICIÓN DE LOS VALORES DE LA TABLEVIEW
    var dipTapOnCell : ((Int) -> Void)?
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dipTapOnCell?(indexPath.row)
    }
}
