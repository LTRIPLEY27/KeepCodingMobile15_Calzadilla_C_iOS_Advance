//
//  HeroListView.swift
//  iOS_Advance_practice
//
//  Created by IsaDevs on 18/2/23.
//

import Foundation
import UIKit

class HeroListView : UIView {
    
    // CONSTRUCTORES
    override init(frame: CGRect) {
        super.init(frame: frame)
        startView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // DEFINICIÓN DE LOS ATRIBUTOS DE LA VISTA
    let title = {
       let label = UILabel()
        label.text = "Dragon Ball Characters"
        label.font = .boldSystemFont(ofSize: 32)
        label.textAlignment = .center
        label.textColor = .red
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let table = {
       let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(HeroeCell.self, forCellReuseIdentifier: "customCell")
        table.backgroundColor = .white
        table.alpha = 0.90
        table.layer.cornerRadius = 20
        
        return table
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
        addSubview(title)
        addSubview(table)
        
        NSLayoutConstraint.activate([
            // CONSTRAINTS DEL BACKGROUND
            background.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            background.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            background.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            background.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            // CONSTRAINTS DEL TITLE
            title.topAnchor.constraint(equalTo: topAnchor, constant: 60),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            title.heightAnchor.constraint(equalToConstant: 30),
            
            // CONSTRAINTS DEL BACKGROUND
            table.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10),
            table.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 20),
            table.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -20),
            table.bottomAnchor.constraint(equalTo: background.bottomAnchor, constant: -25),
        ])
    }
}
