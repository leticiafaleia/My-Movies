//
//  Movie.swift
//  My Movies
//
//  Created by Letícia on 18/12/20.
//

import Foundation

struct MovieDsta: Codable {
    let results: [Movie]
}

struct Movie: Codable {
    let title: String
    let poster: String
    let overview: String
    let category: String
}
