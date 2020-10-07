//
//  PopularCollectionViewCell.swift
//  movieAppWittProgUI
//
//  Created by MCT on 1.10.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import UIKit

class PopularCollectionViewCell: UICollectionViewCell {
    
    //MARK: - properties
    
    //MARK: - view
    
    var movieImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "joel-filipe-RFDP7_80v5A-unsplash")
        return iv
    }()
    
    var movieName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .black
        label.textAlignment = .center
        label.text = "Film Name"
        label.backgroundColor = .cyan
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    
    //MARK: - lifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(movieImage)
        contentView.addSubview(movieName)
        
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - func
    
    func setUpUI() {
        
        movieImage.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        movieImage.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        movieImage.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        movieImage.heightAnchor.constraint(equalToConstant: contentView.frame.height/1.30).isActive = true
        
        movieName.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 5).isActive = true
        movieName.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        movieName.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        
        
        
    }
}
