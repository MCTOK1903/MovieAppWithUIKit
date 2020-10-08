//
//  MovieCastCollectionViewCell.swift
//  movieAppWittProgUI
//
//  Created by MCT on 1.10.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import UIKit

class MovieCastCollectionViewCell: UICollectionViewCell {
    
    
    // MARK: properties
    
    // MARK: view
    
    var castImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "joel-filipe-RFDP7_80v5A-unsplash")
        return iv
    }()
    
    var castName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "Cast Name"
        label.backgroundColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    
    // MARK: lifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(castImage)
        contentView.addSubview(castName)
        
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: func
    
    func setUpUI() {
        
        castImage.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        castImage.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        castImage.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        castImage.heightAnchor.constraint(equalToConstant: contentView.frame.height/1.30).isActive = true
        
        castName.topAnchor.constraint(equalTo: castImage.bottomAnchor, constant: 5).isActive = true
        castName.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        castName.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
    }
    
}
