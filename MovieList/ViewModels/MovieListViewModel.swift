//
//  MovieListViewModel.swift
//  MovieList
//
//  Created by Ronald Napa on 6/5/22.
//

import SwiftUI

class MovieListViewModel: ObservableObject {
    
    @Published var fetchedMovies: [Movie] = []
    @Published var isLoading: Bool = false
    
    init() {
        //getAllMovies()
    }
    
    func getAllMovies() {
        
        
        self.isLoading = true
        
        let url = URL(string:  "https://my-json-server.typicode.com/horizon-code-academy/fake-movies-api/movies")!
        
        let task = URLSession.shared.dataTask(with: url){ (data, response, error) in
            
            
            let decoder = JSONDecoder()
            
            if let data = data {
                
                do {
                    
                    let movies = try decoder.decode([Movie].self, from: data)
                    
                    DispatchQueue.main.async {
                        self.fetchedMovies = movies
                        self.isLoading = false
                    }
                    
                } catch {
                    
                    print(error)
                    
                }
            }
            
        }
        
        task.resume()
        
    }
    
}
