//
//  MovieViewController.swift
//  movieAppWittProgUI
//
//  Created by MCT on 1.10.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {
    
    //MARK: - View
    
    private let scrollView: UIScrollView = {
       let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private let nowPlayingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.text = "Now Plaing Movies"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .white
        return label
    }()
    
    private let nowPlayingCollectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(NowPlayingCollectionViewCell.self, forCellWithReuseIdentifier: "nowPlayingCell")
        cv.backgroundColor = .white
        cv.tag = 0
        return cv
    }()
    
    private let topRatedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.text = "Top Rated Movies"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .white
        return label
    }()
    
    private let topRatedCollectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(TopRatedCollectionViewCell.self, forCellWithReuseIdentifier: "topRatedCell")
        cv.backgroundColor = .white
        cv.tag = 1
        return cv
    }()
    
    private let popularLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.text = "Popular Movies"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .white
        return label
    }()
    
    private let popularCollectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(PopularCollectionViewCell.self, forCellWithReuseIdentifier: "popularCell")
        cv.backgroundColor = .white
        cv.tag = 2
        return cv
    }()
    

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        
        self.nowPlayingCollectionView.dataSource = self
        self.nowPlayingCollectionView.delegate = self
        
        self.topRatedCollectionView.dataSource = self
        self.topRatedCollectionView.delegate = self
        
        self.popularCollectionView.dataSource = self
        self.popularCollectionView.delegate = self
        
        view.addSubview(scrollView)
        
        scrollView.addSubview(nowPlayingLabel)
        scrollView.addSubview(nowPlayingCollectionView)
        scrollView.addSubview(topRatedLabel)
        scrollView.addSubview(topRatedCollectionView)
        scrollView.addSubview(popularLabel)
        scrollView.addSubview(popularCollectionView)
        
        setUpNavigarionBar()
        setUpUI()
    }
    
    override func viewDidLayoutSubviews(){
        super.viewDidLayoutSubviews()
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: scrollView.frame.width, height:  UIScreen.main.bounds.height)
    }

    //MARK: - Funcs
    
    
    func setUpNavigarionBar(){
        navigationItem.title = "Movie"
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0)]
        self.navigationController?.navigationBar.isTranslucent = false
        
    }
    
    func setUpUI() {
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        nowPlayingLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10).isActive = true
        nowPlayingLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        nowPlayingLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        nowPlayingCollectionView.topAnchor.constraint(equalTo: nowPlayingLabel.bottomAnchor, constant: 10).isActive = true
        nowPlayingCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        nowPlayingCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        nowPlayingCollectionView.heightAnchor.constraint(equalToConstant: view.frame.height / 4).isActive = true
        
        topRatedLabel.topAnchor.constraint(equalTo: nowPlayingCollectionView.bottomAnchor, constant: 15).isActive = true
        topRatedLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        topRatedLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        topRatedCollectionView.topAnchor.constraint(equalTo: topRatedLabel.bottomAnchor, constant: 10).isActive = true
         topRatedCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
         topRatedCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        topRatedCollectionView.heightAnchor.constraint(equalToConstant: view.frame.height / 4).isActive = true
        
        popularLabel.topAnchor.constraint(equalTo: topRatedCollectionView.bottomAnchor, constant: 15).isActive = true
        popularLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        popularLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        popularCollectionView.topAnchor.constraint(equalTo: popularLabel.bottomAnchor, constant: 10).isActive = true
        popularCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        popularCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        popularCollectionView.heightAnchor.constraint(equalToConstant: view.frame.height / 4).isActive = true
    }

}


extension MovieViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView.tag {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "nowPlayingCell", for: indexPath) as! NowPlayingCollectionViewCell
            cell.backgroundColor = .red
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "topRatedCell", for: indexPath) as! TopRatedCollectionViewCell
            cell.backgroundColor = .brown
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "popularCell", for: indexPath) as! PopularCollectionViewCell
            cell.backgroundColor = .gray
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.width/1.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch collectionView.tag {
        case 0:
            navigationController?.pushViewController(MovieDetailViewController(), animated: true)
        default:
            return
        }
    }
    
    
    
}
