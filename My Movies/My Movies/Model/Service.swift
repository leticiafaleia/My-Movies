//
//  Service.swift
//  My Movies
//
//  Created by Letícia on 17/12/20.
//

import Foundation
import Alamofire

class Service {
    
    static private let apiKey = "0d4f11660b778f62d78733a76c103a30"
    static private let urlPopularMovies = "https://api.themoviedb.org/3/movie/popular?api_key="

    
    class func fetchPopularMovies(onComplete: @escaping (MovieDsta?) -> Void){
        let url = urlPopularMovies + apiKey + "&page=1"
        AF.request(url, method: .get, parameters: ["String": ["Any"]]).responseJSON { (response) in
            if let data = response.value {
                print(data)
            }
        }
  }
    
    class func fetchMovieByName(name: String?, onComplete: @escaping (Movie?) -> Void){
        let urlMovieSearch = "https://api.themoviedb.org/3/search/movie?api_key="
        let plusSearch: String
        if let movieName = name, !movieName.isEmpty {
            plusSearch = "&query=\(movieName.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil))"
        } else {
            plusSearch = ""
            print("Por favor digite um nome!")
        }
        
        let url = urlMovieSearch + apiKey + plusSearch
     
        AF.request(url, method: .get, parameters: ["String" : ["Any"]]).responseJSON { (response) in
            if let data = response.value {
                print(url)
                print(data)
                }
            }
        }
    }
