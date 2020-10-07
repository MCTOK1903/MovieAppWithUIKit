//
//  TopRatedMovieViewModel.swift
//  movieAppWittProgUI
//
//  Created by MCT on 7.10.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import Foundation
import Alamofire

class TopRatedMovieViewModel: MovieVCViewModelType {
    
    // MARK: Properties
    
    var results: [Result] = [] {
        didSet {
            resultsDidChange?(results)
        }
    }
    
    var resultsDidChange: (([Result]) -> Void)?
    
    // MARK: Funcs
    
    func numberOfItemsInSection(section: Int) -> Int {
        return results.count
    }
    
    func cellForItemAt(indexPath: IndexPath) -> MovieCellViewModelType {
        let result = results[indexPath.item]
        return MovieCellViewModel(movieResult: result)
    }
    
    func fetchMovie(completion: @escaping (AFResult<Codable>) -> Void) {
        NetworkService.shared.service(.get, url: UrlConstant.TOP_RATED_MOVIE, model: Movie.self) { [weak self] (response) in
            
            switch response {
            case .success(let movieModel):
                let movieResult = movieModel as! Movie
                self?.results = movieResult.results
            case .failure(let error):
                print("error: \(error)")
                break
            }
        }
    }
    
    
    
    
    
}
