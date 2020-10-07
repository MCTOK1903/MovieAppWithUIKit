//
//  MovieDetailViewModel.swift
//  movieAppWittProgUI
//
//  Created by MCT on 7.10.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import Foundation
import Alamofire

class MovieDetailViewModel: MovieDetailViewModelType {
    
    // MARK: Funcs
    func fetchMovieDetail(targetId: Int,completion: @escaping (AFResult<Codable>) -> Void) {
        
        let targetUrl = UrlConstant.MOVIE_URL + "\(targetId)" + UrlConstant.API_KEY
        
        NetworkService.shared.service(.get, url:targetUrl, model: MovieDetail.self) { (response) in
            
            switch response {
            case .success(let movieDetailModel):
                let movieDetailResult = movieDetailModel as! MovieDetail
                print(movieDetailResult.title)
            case .failure(let error):
                print("error: \(error)")
            }
        }
    }
    
    
}
