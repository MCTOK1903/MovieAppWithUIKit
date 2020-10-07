//
//  MovieVCViewModelType.swift
//  movieAppWittProgUI
//
//  Created by MCT on 7.10.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import Foundation
import Alamofire

protocol MovieVCViewModelType {
    func numberOfItemsInSection(section: Int) -> Int
    func cellForItemAt(indexPath: IndexPath) -> MovieCellViewModelType
    
    func fetchMovie(completion: @escaping (AFResult<Codable>) ->Void)
    var resultsDidChange: (([Result]) -> Void)? { get set }
    func getSelectedId(indexPath: IndexPath)-> Int
}
