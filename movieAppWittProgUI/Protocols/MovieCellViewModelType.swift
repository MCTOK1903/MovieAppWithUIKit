//
//  MovieDetailVCViewModelType.swift
//  movieAppWittProgUI
//
//  Created by MCT on 7.10.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import Foundation

protocol MovieCellViewModelType {
    var popularity: Double {get}
    var voteCount: Int {get}
    var video: Bool {get}
    var posterPath: String {get}
    var id: Int {get}
    var adult: Bool {get}
    var backdropPath: String {get}
    var originalLanguage: String {get}
    var originalTitle: String {get}
    var genreIDS: [Int] {get}
    var title: String {get}
    var voteAverage: Double {get}
    var overview: String {get}
    var releaseDate: String {get}
    var imageUrl: URL {get}
}
