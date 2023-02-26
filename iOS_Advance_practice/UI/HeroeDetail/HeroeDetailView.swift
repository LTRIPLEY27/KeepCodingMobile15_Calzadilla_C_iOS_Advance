//
//  HeroeDetail.swift
//  iOS_Advance_practice
//
//  Created by IsaDevs on 18/2/23.
//

import Foundation
import UIKit
import Kingfisher

class HeroDetailView : UIView {
    
    // CONSTRUCTORES
    override init(frame: CGRect) {
        super.init(frame: frame)
        startView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let image : UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let titleName : UILabel = {
        let label = UILabel()
        label.textColor = .cyan
        label.backgroundColor = .white
        label.alpha = 0.80
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 32)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let descriptio : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.backgroundColor = .white
        label.alpha = 0.80
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.font = .systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let scroll : UIScrollView = {
       let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        
        return scroll
    }()
    
    let background = {
        let image = UIImageView()
        image.image = UIImage(named: "dragon.jpg")
        image.alpha = 0.95
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    func startView() {
        addSubview(background)
        addSubview(image)
        addSubview(titleName)
        //addSubview(scroll)
        //scroll.addSubview(descriptio)
        addSubview(descriptio)
        
        NSLayoutConstraint.activate([
            // CONSTRAINTS DEL BACKGROUND
            background.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            background.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            background.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            background.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -80),

            
            // CONSTRAINTS IMAGE
            image.topAnchor.constraint(equalTo: background.topAnchor, constant: 100),
            image.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 30),
            image.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -30),
            image.bottomAnchor.constraint(equalTo: background.bottomAnchor, constant: -300),
            
            // CONSTRAINTS TITLE NAME
            titleName.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 30),
            titleName.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 30),
            titleName.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -30),
            titleName.heightAnchor.constraint(equalToConstant: 40),
            titleName.widthAnchor.constraint(equalToConstant: 180),
            
            // CONSTRAINTS TITLE NAME
            descriptio.topAnchor.constraint(equalTo: titleName.bottomAnchor, constant: 30),
            descriptio.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 20),
            descriptio.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -30),
            descriptio.bottomAnchor.constraint(equalTo: background.bottomAnchor, constant: -20),
            
            /*scroll.topAnchor.constraint(equalTo: titleName.bottomAnchor, constant: 30),
             scroll.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 20),
             scroll.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -30),
             scroll.bottomAnchor.constraint(equalTo: background.bottomAnchor, constant: -20),*/
        ])
    }
    
    func putElementsOnView(_ model : Heroe) {
        self.titleName.text = model.name
        self.descriptio.text = model.descripcion
        self.image.kf.setImage(with: URL(string: model.photo ?? ""))
    }
}
