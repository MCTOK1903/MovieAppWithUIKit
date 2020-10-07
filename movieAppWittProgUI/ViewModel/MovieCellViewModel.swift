//
//  MovieCellViewModel.swift
//  movieAppWittProgUI
//
//  Created by MCT on 7.10.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import Foundation

class MovieCellViewModel: MovieCellViewModelType {
    
    // MARK: Properties
    
    private var movieResult: Result
    
    var popularity: Double {
        return movieResult.popularity
    }
    
    var voteCount: Int {
        return movieResult.vote_count
    }
    
    var video: Bool {
        return movieResult.video
    }
    
    var posterPath: String {
        return movieResult.poster_path
    }
    
    var id: Int {
        return movieResult.id
    }
    
    var adult: Bool {
        return movieResult.adult
    }
    
    var backdropPath: String {
        return movieResult.backdrop_path
    }
    
    var originalLanguage: String {
        return movieResult.original_language
    }
    
    var originalTitle: String {
        return movieResult.original_title
    }
    
    var genreIDS: [Int] {
        return movieResult.genre_ids
    }
    
    var title: String {
        return movieResult.title
    }
    
    var voteAverage: Double {
        return movieResult.vote_average
    }
    
    var overview: String {
        return movieResult.overview
    }
    
    var releaseDate: String {
        return movieResult.release_date
    }
    
    var imageUrl: URL {
        let url = URL(string: UrlConstant.IMAGE_URL + "\(posterPath)")!.absoluteURL
        return url
    }
    
    // MARK: LifeCycle
    
    init(movieResult: Result) {
        self.movieResult = movieResult
    }
}
