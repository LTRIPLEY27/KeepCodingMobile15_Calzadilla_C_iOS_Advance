//
//  TabBarClass.swift
//  iOS_Advance_practice
//
//  Created by IsaDevs on 20/2/23.
//

import Foundation
import UIKit

class TabController : UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        putOnView()
        setLayout()
        
        //
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(allRegisters),
                                               name: Notification.Name("allRegisters"),
                                               object: nil)
        
    }

    @objc func allRegisters() {
        print("Sending Saiyans from Tab")
    }

    // EN LA FUNCIÓN SE DEFINEN LAS POSICIONES DE LOS TAGS A MOSTRAR
    private func putOnView() {
        
        // DEFINICIÓN DEL NAVIGATION CONTROLLER QUE INVOQUE A LA TABLEVIEW
        let navControllerA = UINavigationController(rootViewController: HeroViewController())
        let tabImageA = UIImage(systemName: "text.justify")!
        
        // DEFINICIÓN DEL NAV Y EL ITEM EN LA VIEW  -->
        navControllerA.tabBarItem = UITabBarItem(title: "TableView", image: tabImageA, tag: 0)
        
        // DEFINICIÓN DEL NAVIGATION CONTROLLER QUE INVOQUE A LA COLLECTIONVIEW
        let navControllerB = UINavigationController(rootViewController: HeroViewController())
        /*let tabImageB = UIImage(systemName: "mappin.and.ellipse")!
        
        // DEFINICIÓN DEL NAV Y EL ITEM EN LA VIEW  -->
        navControllerB.tabBarItem = UITabBarItem(title: "MappinView", image: tabImageB, tag: 1)*/
        
       /* let navControllerC = UINavigationController(rootViewController: FavoriteController())
        let tabImageC = UIImage(systemName: "heart.text.square")!
        
        navControllerC.tabBarItem = UITabBarItem(title: "Favs", image: tabImageC, tag: 3)
        

        let navControllerD = UINavigationController(rootViewController : NewCharacterController())
        let tabImageD = UIImage(systemName: "goforward.plus")
        
        navControllerD.tabBarItem = UITabBarItem(title: "Add", image: tabImageD, tag: 4)*/
        
        // ARRAY DE ITEMS A CONTENER EN EL TAB, LE INDICAMREMOS, CUANTOS DESEEMOS
        viewControllers = [navControllerA/*, navControllerB*/]
    }
    
    private func setLayout(){
        
        tabBar.backgroundColor = .systemBackground
    }
}
