//
//  MovieTableViewController.swift
//  My Movies
//
//  Created by Letícia on 29/12/20.
//

import UIKit

class MovieTableViewController: UITableViewController {
    
    var movieName: String = ""
    var movies: [Movie] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        loadPopularMovies()
    }

    // MARK: - Table view data source
    
    func loadPopularMovies(){
        Service.fetchPopularMovies { (movieInfo) in
            if let movie = movieInfo {
                self.movies += movie.results
            }
        }
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieTableViewCell

        let movie = movies[indexPath.row]
        return cell
    }

}
