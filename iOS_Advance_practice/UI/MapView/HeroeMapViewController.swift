//
//  HeroeMapViewController.swift
//  iOS_Advance_practice
//
//  Created by IsaDevs on 25/2/23.
//

import Foundation
import MapKit

class HeroeMapViewController : UIViewController {
    
    var mainView : HeroMapView { self.view as! HeroMapView }
    var map : MKMapView?
    var button : UIButton?
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func loadView() {
        
        let map = HeroMapView()
        self.button = map.getButton()
        view = map//HeroMapView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        map = MKMapView()
       // mainView.button.addTarget(self, action: #selector(call), for: .touchUpInside)
        button?.addTarget(self, action: #selector(call), for: .touchUpInside)
    }
    
    @objc
    func call(){
        debugPrint("hola desde el map, funcina")
    }
}
