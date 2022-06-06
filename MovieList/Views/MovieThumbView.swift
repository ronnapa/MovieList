//
//  MovieThumbView.swift
//  MovieList
//
//  Created by Ronald Napa on 6/4/22.
//

import SwiftUI



struct MovieThumbView: View {
    
    var body: some View {
        VStack {
            Image("movie_placeholder")
                        .resizable()
                        .scaledToFit()
            HStack(spacing: 10) {
                Text("Movie Placeholder")
                Text("2022")
            }
        }
    }
}

struct MovieThumbView_Previews: PreviewProvider {
    static var previews: some View {
        MovieThumbView()
    }
}
