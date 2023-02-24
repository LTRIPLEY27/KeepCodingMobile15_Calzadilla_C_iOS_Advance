//
//  HeroCell.swift
//  iOS_Advance_practice
//
//  Created by IsaDevs on 18/2/23.
//

import Foundation
import UIKit
import Kingfisher

class HeroeCell : UITableViewCell {
    
    // constructores
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        startView()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    required init?(coder : NSCoder){
        fatalError("Error on the cell")
    }
    
    let image : UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let titleName : UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.font = .boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let descriptio : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.font = .systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    /*let scroll : UIScrollView = {
       let scroll = UIScrollView()
        
        scroll.translatesAutoresizingMaskIntoConstraints = false
        
        return scroll
    }()*/
    
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
        //addSubview(scroll)
        //scroll.addSubview(descriptio)
        
        NSLayoutConstraint.activate([
            // CONSTRAINTS BACKGROUND
            background.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            background.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            background.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            background.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            // CONSTRAINTS PHOTO
            image.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            image.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -180),
            image.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            // CONSTRAINTS TITLE
            titleName.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleName.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 5),
            titleName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            titleName.heightAnchor.constraint(equalToConstant: 30),
            
            // CONSTRAINTS description
            descriptio.topAnchor.constraint(equalTo: titleName.topAnchor, constant: 20),
            descriptio.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            descriptio.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            descriptio.bottomAnchor.constraint(equalTo: bottomAnchor, constant:  10),
        ])
    }
    
    // SETTING VALUES
    // UBICA LOS ELEMENTOS USANDO EL STRUCT MODEL
    // USO DE LA LIBRERÍA KINGFISHER PARA EL TRATAMIENTO DE LA IMAGEN
    func putElementsOnView(_ model : HeroeModel) {
        self.titleName.text = model.name
        self.descriptio.text = model.description
        self.image.kf.setImage(with: URL(string: model.photo ?? ""))
    }
}
