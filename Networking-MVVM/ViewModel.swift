 //
//  ViewModel.swift
//  Networking-MVVM
//
//  Created by 123 on 02.04.2018.
//  Copyright © 2018 123. All rights reserved.
//

import UIKit

typealias Dicts = [String:Any]
 
class ViewModel: NSObject {
    
    @IBOutlet var moviesClient: MoviesClient!
    var movies: [Dicts]?
    
    func fetchMovies(completion: @escaping ()->() ) {
        moviesClient.fetchMovies { movies in
            self.movies = movies
            completion()
        }
    }
    
    func numberItemsIn(_ section: Int) -> Int {
        return movies?.count ?? 0
    }

    func titleForItemAt(_ indexPath: IndexPath) -> String {
        return "\(String(describing: movies?[indexPath.row] ?? [:]))" + "\(indexPath.row)"
    }
}

 
 
 
 
 
 
 
 
 
 
 
 
