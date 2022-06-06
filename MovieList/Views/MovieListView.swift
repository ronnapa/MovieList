//
//  MovieListView.swift
//  MovieList
//
//  Created by Ronald Napa on 6/5/22.
//

import SwiftUI

struct MovieListView: View {
    
    let movieList = [Movie]()
    @StateObject var movieListViewModel = MovieListViewModel()
    
    @State private var contentSize: CGSize = .zero
    let imageSize: CGFloat = 300
    
    var body: some View {
        NavigationView{
            List (movieListViewModel.fetchedMovies, id: \.self) { movie in
                NavigationLink(destination: MovieDetailView(movie: movie), label: {
                    MovieRowView(movie: movie)
//                    VStack {
//                        AsyncImage(url: URL(string: movie.poster)) { phase in
//                            if let image = phase.image {
//                                image.resizable()
//                                    .scaledToFit()
//                                    .clipped()
//
//                            } else if phase.error != nil {
//                                Image("no_poster")
//                                    .resizable()
//                                    .scaledToFit()
//                                    .clipped()
//                            } else {
//                                ProgressView()
//                                    .frame(width: imageSize, height: imageSize)
//                            }
//                        }
//                        VStack(spacing: 10) {
//                            Text(movie.title)
//                            Text(movie.year)
//                        }
//                    }
                })
            }
            .navigationTitle("Movie List")
            .onAppear{
                movieListViewModel.getAllMovies()
            }
        }
    }
    
}
