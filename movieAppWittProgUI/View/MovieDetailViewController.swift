//
//  MovieDetailViewController.swift
//  movieAppWittProgUI
//
//  Created by MCT on 1.10.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    //MARK: - Properties
    
    
    //MARK: - Views
    
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private let movieImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        image.image = #imageLiteral(resourceName: "fiveyears")
        return image
    }()
    
    private let movieNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.font = UIFont.italicSystemFont(ofSize: 17)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "Movie Name"
        label.textAlignment = .left
        return label
    }()
    
    private let overviewTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "Overview"
        label.textAlignment = .left
        return label
    }()
    
    private let overviewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .white
        label.textAlignment = .center
        label.text = " Overview Overview Overview Overview Overview Overview Overview"
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let movieCastTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "Movie Cast"
        label.textAlignment = .left
        return label
    }()
    
    private let movieCastCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(MovieCastCollectionViewCell.self, forCellWithReuseIdentifier: "movieCastCell")
        cv.backgroundColor = .magenta
        return cv
    }()
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        movieCastCollectionView.delegate = self
        movieCastCollectionView.dataSource = self
        
        view.addSubview(scrollView)
        scrollView.addSubview(movieImage)
        scrollView.addSubview(movieNameLabel)
        scrollView.addSubview(overviewTitleLabel)
        scrollView.addSubview(overviewLabel)
        scrollView.addSubview(movieCastTitleLabel)
        scrollView.addSubview(movieCastCollectionView)
        
        setUpUI()
    }
    
    //MARK: - funcs
    
    func setUpUI(){
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        movieImage.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10).isActive = true
        movieImage.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        movieImage.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        movieImage.heightAnchor.constraint(equalToConstant: view.frame.height/4).isActive = true
        
        movieNameLabel.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 20).isActive = true
        movieNameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        movieNameLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        movieNameLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        overviewTitleLabel.topAnchor.constraint(equalTo: movieNameLabel.bottomAnchor, constant: 15).isActive = true
        overviewTitleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        overviewTitleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        overviewTitleLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        overviewLabel.topAnchor.constraint(equalTo: overviewTitleLabel.bottomAnchor, constant: 10).isActive = true
        overviewLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        overviewLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        
        movieCastTitleLabel.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor, constant: 10).isActive = true
        movieCastTitleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        movieCastTitleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        
        movieCastCollectionView.topAnchor.constraint(equalTo: movieCastTitleLabel.bottomAnchor, constant: 10).isActive = true
        movieCastCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        movieCastCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        movieCastCollectionView.heightAnchor.constraint(equalToConstant: view.frame.height / 4).isActive = true
    }
    
}

//MARK: - Extension

extension MovieDetailViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCastCell", for: indexPath) as! MovieCastCollectionViewCell
        cell.backgroundColor = .red
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.width/1.5)
    }
    
    
}