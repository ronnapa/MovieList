//
//  MovieRowView.swift
//  MovieList
//
//  Created by Ronald Napa on 6/5/22.
//

import SwiftUI

struct MovieRowView: View {
    
    var movie: Movie
    let imageSize: CGFloat = 300
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: movie.poster)) { phase in
                if let image = phase.image {
                    image.resizable()
                        .scaledToFit()
                        .clipped()
                    
                } else if phase.error != nil {
                    Image("no_poster")
                        .resizable()
                        .scaledToFit()
                        .clipped()
                } else {
                    ProgressView()
                        .frame(width: imageSize, height: imageSize)
                }
            }
            VStack(spacing: 10) {
                Text(movie.title)
                Text(movie.year)
            }
        }
    }
}

struct MovieRowView_Previews: PreviewProvider {
    static var previews: some View {
        MovieRowView(movie: Movie.init(title: "", year: "", runtime: ""))
    }
}
