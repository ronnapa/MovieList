//
//  Movie.swift
//  MovieList
//
//  Created by Ronald Napa on 6/4/22.
//

import Foundation
import SwiftUI

//struct Movie: Codable, Identifiable {
//
//    /*
//     "Title": "The Lion King",
//     "Year": "2019",
//     "Runtime": "118 min",
//     "Poster": "https://m.media-amazon.com/images/M/MV5BMjIwMjE1Nzc4NV5BMl5BanBnXkFtZTgwNDg4OTA1NzM@._V1_SX300.jpg"
//     */
//
//    let Title: String
//    let Year: String
//    let Runtime: String
//    let Poster: String!
//    let id: ObjectIdentifier
//
//}

struct Movie: Codable, CustomStringConvertible, Hashable, Identifiable {
    
    let id = UUID()
    let title: String
    let year: String
    let runtime: String
    let poster: String!
    
    var description: String {
        return "Movie Title \(title) , year: \(year) runtime: \(runtime) runtime: \(poster ?? "No poster")"
    }
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case runtime = "Runtime"
        case poster = "Poster"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        title = try values.decode(String.self, forKey: .title)
        year = try values.decode(String.self, forKey: .year)
        runtime = try values.decode(String.self, forKey: .runtime)
        poster = try values.decodeWrapper(key: .poster, defaultValue: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.csaff.org%2Ffilm-guide-2011%2F&psig=AOvVaw3YMXjQc3wLJdubfyqapHLU&ust=1654504771107000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCMjj99v0lfgCFQAAAAAdAAAAABAD")
        
    }
    
    init(title: String, year: String, runtime: String, poster: String = ""){
        self.title = title
        self.year = year
        self.runtime = runtime
        self.poster = poster
    }
    
}

