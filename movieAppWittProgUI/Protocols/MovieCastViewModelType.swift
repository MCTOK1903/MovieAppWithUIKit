//
//  MovieCastViewModelType.swift
//  movieAppWittProgUI
//
//  Created by MCT on 8.10.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import Foundation
import Alamofire

protocol MovieCastViewModelTye {
    func numberOfItemsInSection(section: Int) -> Int
    func cellForItemAt(indexPath: IndexPath) -> MovieCastCellViewModelType
    
    func fetchMovieCast(targetId: Int, completion: @escaping (AFResult<Codable>) ->Void)
    var castsDidChange: (([Cast]) -> Void)? { get set }
}
