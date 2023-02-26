//
//  HeroeMapViewController.swift
//  iOS_Advance_practice
//
//  Created by IsaDevs on 25/2/23.
//

import Foundation
import MapKit
import CoreLocation
import CoreData

class HeroeMapViewController : UIViewController, CLLocationManagerDelegate {
    
    var mainView : HeroMapView { self.view as! HeroMapView }
    var map : MKMapView?
    var locationManager : CLLocationManager?
    var heroes : [Heroe] = []
    // valores de la data fetch
    var responseData = AppDelegate.staticAppDelegate.dataManager.context
    var heroeViewModel : HeroViewModel?
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func loadView() {
        
        let map = HeroMapView()
        
        view = map//HeroMapView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        map = MKMapView()
        locationManager = CLLocationManager()
        locationManager?.requestWhenInUseAuthorization()
        locationManager?.delegate = self
        
        // referencia para mostrar la locacion del map
        map?.showsUserLocation = true
        map?.mapType = .hybrid
        mainView.button.addTarget(self, action: #selector(call), for: .touchUpInside)
        
    
        // llamado a la localizacion de heroes
        showMeHeroes()
    }
    
    func showMeHeroes(){
        
        var heroFetch : NSFetchRequest<Heroe> = Heroe.fetchRequest()
       
        do {
            let result = try AppDelegate.staticAppDelegate.dataManager.context.fetch(heroFetch)
            debugPrint("hay tantos RESULTS --> ", result.count)
            
            let resul = result[3]
            debugPrint(resul)
            let center = CLLocationCoordinate2D(latitude: resul.latitude, longitude: resul.longitude)
            
            // valores que indican el zoom, a mayor número, mayor zoom
            let span = MKCoordinateSpan(latitudeDelta:3, longitudeDelta: 8)
            
            let region = MKCoordinateRegion(center: center, span: span)
            
            map?.setRegion(region, animated: true)
            
            // PRUEBA ANOTATIONS
 //           mainView.map.register(HeroDetailView(), forAnnotationViewWithReuseIdentifier: "GOKU")
        } catch let error {
            debugPrint(error)
        }
        
    }
    
    func getAnotation() {
        
    }
    
    @objc
    func call(){
        debugPrint("hola desde el map, funcina")
    }
    
}

extension HeroMapView : CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        if #available(iOS 14.0, *) {
            switch manager.authorizationStatus {
                
            case .notDetermined:
                debugPrint("Not determined")
            case .restricted:
                debugPrint("restricted")
            case .denied:
                debugPrint("denied")
            case .authorizedAlways:
                debugPrint("authorized always")
            case .authorizedWhenInUse:
                debugPrint("authorized when in use")
            @unknown default:
                debugPrint("unknow status")
            }
        }
    }
}
