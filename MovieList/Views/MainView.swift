//
//  MainView.swift
//  MovieList
//
//  Created by Ronald Napa on 6/5/22.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var movieListViewModel = MovieListViewModel()
    
    var body: some View {
        if movieListViewModel.isLoading {
            LoadingView()
        } else {
            MovieListView()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
