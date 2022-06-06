//
//  MovieRepository.swift
//  MovieList
//
//  Created by Ronald Napa on 6/4/22.
//

import SwiftUI

class MovieRepository: ObservableObject {
    
    @Published var fetchedMovies = [Movie]()
    @Published var isLoading:Bool =  false
    @Published var errorMessage: String? = nil
    
    init(){
        fetchAllMovies()
    }
    
    func fetchAllMovies(){
        
        isLoading = true
        //https://www.fakerestapi.com/datasets/api/v1/movie-details-dataset.json
        let url = URL(string:  "https://my-json-server.typicode.com/horizon-code-academy/fake-movies-api/movies")!
        
        let task = URLSession.shared.dataTask(with: url){ (data, response, error) in
            
            
            let decoder = JSONDecoder()
            
            if let data = data {
                
                do {
                    
                    let movies = try decoder.decode([Movie].self, from: data)
                    
                    DispatchQueue.main.async {
                        self.fetchedMovies = movies
                    }
                    
                } catch {
                    
                    print(error)
                    
                }
            }
            
        }
        
        task.resume()
        
    }
    
}
