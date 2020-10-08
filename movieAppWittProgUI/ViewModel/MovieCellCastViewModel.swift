//
//  MovieCellCastViewModel.swift
//  movieAppWittProgUI
//
//  Created by MCT on 8.10.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import Foundation

class MovieCellCastViewModel: MovieCastCellViewModelType {

    private var movieCast: Cast
    
    var castID: Int {
        return movieCast.castID
    }
    
    var character: String {
        return movieCast.character
    }
    
    var creditID: String {
        return movieCast.creditID
    }
    
    var gender: Int {
        return movieCast.gender
    }
    
    var id: Int {
        return movieCast.id
    }
    
    var name: String {
        return movieCast.name
    }
    
    var order: Int {
        return movieCast.order
    }
    
    var profilePath: String? {
        guard movieCast.profilePath != nil else {
            return "error"
        }
        return movieCast.profilePath
    }
    
    var imageUrl: URL {
        var url: URL
        if profilePath == "error" {
            url = URL(string: "https://www.pngfind.com/mpng/ThxRhw_null-profile-icon-png-white-transparent-png/")!.absoluteURL
        }else {
            url = URL(string: UrlConstant.IMAGE_URL + "\(String(describing: profilePath!))")!.absoluteURL
        }
        return url
    }
    
    init(movieCast: Cast) {
        self.movieCast = movieCast
    }
}
