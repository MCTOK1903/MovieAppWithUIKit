//
//  MovieCastCellViewModelType.swift
//  movieAppWittProgUI
//
//  Created by MCT on 8.10.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import Foundation

protocol MovieCastCellViewModelType {
    var castID: Int { get }
    var character: String { get }
    var creditID: String { get }
    var gender: Int { get }
    var id: Int { get }
    var name: String { get }
    var order: Int { get }
    var profilePath: String? { get }
    var imageUrl: URL {get}
}
