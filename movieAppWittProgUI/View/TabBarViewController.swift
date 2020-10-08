//
//  TabBarViewController.swift
//  movieAppWittProgUI
//
//  Created by MCT on 1.10.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {

    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let movieTab = MovieViewController()
        let tvShowTab = TvShowViewController()
        
        let movieTabbarItem = UITabBarItem(title: "Movie", image: UIImage(named: "defaultImage.png,"),selectedImage: UIImage(named: "UIBarButtonSystemItemPlayFill,"))
        movieTab.tabBarItem = movieTabbarItem
        
        let tvShowTabbarItem = UITabBarItem(title: "TvShow", image: UIImage(named: "UIBarButtonSystemItemStar.png"), selectedImage: UIImage(named: "UIBarButtonSystemItemStarFill"))
        
        tvShowTab.tabBarItem = tvShowTabbarItem
        
        self.viewControllers = [movieTab,tvShowTab]
    }

}
