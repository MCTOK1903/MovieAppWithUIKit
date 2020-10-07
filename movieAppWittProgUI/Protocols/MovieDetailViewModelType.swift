//
//  MovieDetailViewModelType.swift
//  movieAppWittProgUI
//
//  Created by MCT on 7.10.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import Foundation
import Alamofire

protocol MovieDetailViewModelType {
    
    var movieImage:URL {get}
    var movieName:String {get}
    var movieOverView: String {get}
    
    var resultssDidChange: ((MovieDetail)-> Void)? { get set }
    
    func fetchMovieDetail(targetId:Int, completion: @escaping (AFResult<Codable>) ->Void)
    
}
