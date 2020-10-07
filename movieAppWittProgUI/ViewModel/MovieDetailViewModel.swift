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
    
    var movieImage: URL {
        let url = URL(string: UrlConstant.IMAGE_URL + "\(results!.backdropPath)")!.absoluteURL
        return url
    }
    
    var movieName: String {
        return results!.title
    }
    
    var movieOverView: String {
        return results!.overview
    }
    
    var results: MovieDetail? = nil{
        didSet {
            resultssDidChange?(results!)
        }
    }
    
    var resultssDidChange: ((MovieDetail)-> Void)?
    
    // MARK: Funcs
    
    func fetchMovieDetail(targetId: Int,completion: @escaping (AFResult<Codable>) -> Void) {
        
        let targetUrl = UrlConstant.MOVIE_URL + "\(targetId)" + UrlConstant.API_KEY
        
        NetworkService.shared.service(.get, url:targetUrl, model: MovieDetail.self) { [weak self] (response) in
            
            switch response {
            case .success(let movieDetailModel):
                let movieDetailResult = movieDetailModel as! MovieDetail
                self?.results = movieDetailResult
                print("Selam \(movieDetailResult)")
            case .failure(let error):
                print("error: \(error)")
            }
        }
    }
}
