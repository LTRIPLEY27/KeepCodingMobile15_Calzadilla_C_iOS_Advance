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
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = HeroMapView()
    }
    
    override func viewDidLoad() {
        map = MKMapView()
    }
}
