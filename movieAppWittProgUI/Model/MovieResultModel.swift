//
//  MovieResultModel.swift
//  movieAppWittProgUI
//
//  Created by MCT on 7.10.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import Foundation

struct Result: Codable {
    let popularity: Double
    let vote_count: Int
    let video: Bool
    let poster_path: String
    let id: Int
    let adult: Bool
    let backdrop_path: String
    let original_language: String
    let original_title: String
    let genre_ids: [Int]
    let title: String
    let vote_average: Double
    let overview: String
    let release_date: String
}
