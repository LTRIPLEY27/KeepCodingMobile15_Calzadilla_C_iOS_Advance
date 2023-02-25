//
//  HeroeDetailController.swift
//  iOS_Advance_practice
//
//  Created by IsaDevs on 24/2/23.
//

import Foundation
import UIKit

class HeroeDetailController : UIViewController {
    
    var detail : HeroDetailView { self.view as! HeroDetailView}
    
    var heroe : Heroe?
    
    init(){
        super.init(nibName: nil, bundle: nil)
  
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        
    }
    
    override func viewDidLoad() {
        putElementsOnView()
    }

    func putElementsOnView() {
        
        let detail = HeroDetailView()
        
        /*detail.image.kf.setImage(with: URL(string: self.heroe?.photo ?? ""))
        detail.titleName.text = heroe?.name
        detail.descriptio.text = heroe?.descripcion*/
        
        view = HeroDetailView()
    }
}
