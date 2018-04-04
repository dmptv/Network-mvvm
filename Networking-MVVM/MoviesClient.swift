//
//  MoviesClient.swift
//  Networking-MVVM
//
//  Created by 123 on 02.04.2018.
//  Copyright © 2018 123. All rights reserved.
//

import UIKit

class MoviesClient: NSObject {

    func fetchMovies(completion: @escaping (_ movies: [Dicts]?) -> () ) {
        
        let url = URL(string: "https://itunes.apple.com/us/rss/topmovies/limit=25/json")
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url!) { data, response, error in
            if error != nil {
                completion(nil)
                return
            }
            
            if let code = (response as? HTTPURLResponse)?.statusCode {
                if (201...400).contains(code) {
                    print("error is ", error?.localizedDescription as Any)
                    return
                }
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as? Dicts
                
                if let feed = json?["feed"] as? Dicts, let movies = feed["entry"] as? [Dicts] {
                    completion(movies)
                    return
                }
                
            } catch let err {
                print(err.localizedDescription)
                completion(nil)
            }
        }
        task.resume()
    }
}












