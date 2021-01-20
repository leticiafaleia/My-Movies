//
//  ViewController.swift
//  My Movies
//
//  Created by Letícia on 26/11/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var movieTableView: UITableView!
    var movieName: String = ""
    var movies: [Movie] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //fetchMovies()
        fetchMovieByName()
    }
    
    func fetchMovies(){
     //   Service.fetchPopularMovies
    }
    
    func fetchMovieByName(){
        Service.fetchPopularMovies { (movieInfo) in
            if let movie = movieInfo {
                self.movies += movie.results
            }
        }
    }


}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    private func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieTableViewCell

        let movie = movies[indexPath.row]
        return cell
    }
}

