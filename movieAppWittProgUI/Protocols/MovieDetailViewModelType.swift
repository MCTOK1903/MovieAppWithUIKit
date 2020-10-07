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
    
    func fetchMovieDetail(targetId:Int, completion: @escaping (AFResult<Codable>) ->Void)
    
}
