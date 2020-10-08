//
//  MovieCastViewModel.swift
//  movieAppWittProgUI
//
//  Created by MCT on 8.10.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import Foundation
import Alamofire

class MovieCastViewModel: MovieCastViewModelTye {
    
    var casts: [Cast] = [] {
        didSet{
            castsDidChange?(casts)
        }
    }
    
    var castsDidChange: (([Cast]) -> Void)?
    
    func numberOfItemsInSection(section: Int) -> Int {
        return casts.count
    }
    
    func cellForItemAt(indexPath: IndexPath) -> MovieCastCellViewModelType {
        let cast = casts[indexPath.item]
        return MovieCellCastViewModel(movieCast: cast)
    }
    
    func fetchMovieCast(targetId: Int, completion: @escaping (AFResult<Codable>) -> Void) {
        
        let targetUrl = UrlConstant.MOVIE_URL + "\(targetId)" + "/credits" + UrlConstant.API_KEY
        
        NetworkService.shared.service(.get, url: targetUrl, model: MovieCast.self) { (responce) in
            
            switch responce {
            case .success(let movieCastModel):
                let movieCastResult = movieCastModel as! MovieCast
                self.casts = movieCastResult.cast
            case .failure(let error):
                print("error: \(error)")
            }
        }
    }
}
