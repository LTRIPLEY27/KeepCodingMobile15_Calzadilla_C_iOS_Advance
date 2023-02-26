//
//  HeroMapView.swift
//  iOS_Advance_practice
//
//  Created by IsaDevs on 25/2/23.
//

import Foundation
import UIKit
import MapKit

class HeroMapView : UIView {
    
    // CONSTRUCTORES
    override init(frame: CGRect) {
        super.init(frame: frame)
        startView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK : DEFINICIÓN DE LOS COMPONENTES DE LA VISUAL
    let title = {
       let label = UILabel()
        label.text = "Heroe Locations"
        label.font = .boldSystemFont(ofSize: 32)
        label.textAlignment = .center
        label.backgroundColor = .white
        label.alpha = 0.80
        label.textColor = .red
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let map = {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        map.layer.cornerRadius = 20
        map.alpha = 0.85
        
        return map
    }()
    
    let button = {
        let button = UIButton()
        button.backgroundColor = .red
        button.setTitle("Log In", for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let background = {
        let image = UIImageView()
        image.image = UIImage(named: "dragon.jpg")
        image.alpha = 0.95
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    func startView(){
        addSubview(background)
        addSubview(button)
        addSubview(title)
        addSubview(map)
        
        NSLayoutConstraint.activate([
            // CONSTRAINTS DEL BACKGROUND
            background.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            background.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            background.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            background.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            button.topAnchor.constraint(equalTo: topAnchor, constant: 60),
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 250),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            button.heightAnchor.constraint(equalToConstant: 30),
            button.widthAnchor.constraint(equalToConstant: 80),
        
            // CONSTRAINTS DEL TITLE
            title.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 5),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            title.heightAnchor.constraint(equalToConstant: 30),
            
            map.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 20),
            map.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 30),
            map.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -30),
            map.bottomAnchor.constraint(equalTo: background.bottomAnchor, constant: -95),
        ])
    }
    
    func getButton() -> UIButton {
        return button
    }
}
