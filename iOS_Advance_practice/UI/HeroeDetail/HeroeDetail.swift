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
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.font = .systemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let descriptio : UILabel = {
        let label = UILabel()
        label.textColor = .black
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
    
    let background : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "dragonBalls.jpg")
        image.alpha = 0.65
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    func startView() {
        addSubview(background)
        addSubview(image)
        addSubview(titleName)
        addSubview(descriptio)
        
        NSLayoutConstraint.activate([
            // CONSTRAINTS BACKGROUND
            background.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            background.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            background.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            background.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            // CONSTRAINTS IMAGE
            image.topAnchor.constraint(equalTo: background.topAnchor, constant: 40),
            image.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 20),
            image.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -20),
            image.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -450),
            
            // CONSTRAINTS TITLE NAME
            titleName.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 30),
            titleName.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 30),
            titleName.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -30),
            titleName.heightAnchor.constraint(equalToConstant: 40),
            titleName.widthAnchor.constraint(equalToConstant: 180),
            
            // CONSTRAINTS TITLE NAME
            descriptio.topAnchor.constraint(equalTo: titleName.bottomAnchor, constant: 30),
            descriptio.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 20),
            descriptio.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -20),
            descriptio.bottomAnchor.constraint(equalTo: background.bottomAnchor, constant: 30),
        ])
    }
    
    func putElementsOnView(_ model : Heroe) {
        self.titleName.text = model.name
        self.descriptio.text = model.descripcion
        self.image.kf.setImage(with: URL(string: model.photo ?? ""))
    }
}
